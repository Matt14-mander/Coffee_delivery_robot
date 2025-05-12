/*
    需求: 
        编写两个节点实现服务通信，客户端节点需要提交四个整数到服务器
        服务器需要解析客户端提交的数据，将数据发送到STM32改变灯光，
        将结果响应回客户端，客户端再解析

    服务器实现:
        1.包含头文件
        2.初始化 ROS 节点
        3.创建 ROS 句柄
        4.创建 客户端 对象
        5.请求服务，接收响应

*/
// 1.包含头文件
#include "ros/ros.h"
#include "light_service/Light_Set.h"

int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");

    // 调用时动态传值,如果通过 launch 的 args 传参，需要传递的参数个数 +5
    if (argc != 7)
    {
        ROS_ERROR("请提交七个整数");
        return 1;
    }


    // 2.初始化 ROS 节点
    ros::init(argc,argv,"Light_Client");
    // 3.创建 ROS 句柄
    ros::NodeHandle nh;
    // 4.创建 客户端 对象
    ros::ServiceClient light_client = nh.serviceClient<light_service::Light_Set>("Light_Server");
    //等待服务启动成功
    //方式1
    ros::service::waitForService("Light_Server");
    //方式2
    // light_client.waitForExistence();
    // 5.组织请求数据
    light_service::Light_Set value;
    value.request.RGB_M_ = atoi(argv[1]);
    value.request.RGB_S_ = atoi(argv[2]);
    value.request.RGB_T_ = atoi(argv[3]);
    value.request.RGB_R_ = atoi(argv[4]);
    value.request.RGB_G_ = atoi(argv[5]);
    value.request.RGB_B_ = atoi(argv[6]);
    // 6.发送请求,返回 bool 值，标记是否成功
    bool flag = light_client.call(value);
    // 7.处理响应
    if (flag)
    {
        ROS_INFO("请求正常处理,响应结果:%s",value.response.result.c_str());
    }
    else
    {
        ROS_ERROR("请求处理失败....");
        return 1;
    }

    return 0;
}