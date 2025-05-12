/*
    需求: 实现基本的话题通信，一方发布数据，一方接收数据，
         实现的关键点:
         1.发送方
         2.接收方
         3.数据(此处为int8类型变量)

         PS: 二者需要设置相同的话题


    消息发布方:
        循环发布信息0使蜂鸣器停止鸣叫

    实现流程:
        1.包含头文件 
        2.初始化 ROS 节点:命名(唯一)
        3.实例化 ROS 句柄
        4.实例化 发布者 对象
        5.组织被发布的数据，并编写逻辑发布数据
*/

//包含头文件
#include "ros/ros.h"
#include "std_msgs/Int8.h"

#include <sstream>

int main(int argc, char  *argv[])
{   
    //设置编码
    setlocale(LC_ALL,"");

    //2.初始化 ROS 节点:命名(唯一)
    // 参数1和参数2 后期为节点传值会使用
    // 参数3 是节点名称，是一个标识符，需要保证运行后，在 ROS 网络拓扑中唯一
    ros::init(argc,argv,"beep_off");
    //3.实例化 ROS 句柄
    ros::NodeHandle nh;//该类封装了 ROS 中的一些常用功能

    //4.实例化 发布者 对象
    //泛型: 发布的消息类型                                              std_msgs::Int8
    //参数1: 要发布到的话题                                             /beep
    //参数2: 队列中最大保存的消息数，超出此阀值时，先进的先销毁(时间早的先销毁)  10
    ros::Publisher beep_pub = nh.advertise<std_msgs::Int8>("/beep",10);

    //5.组织被发布的数据，并编写逻辑发布数据
    //数据(动态组织)
    std_msgs::Int8 beep_msg;
    // beep_msg.data = 0;代表蜂鸣器停止鸣叫
    //逻辑(一秒1次)
    ros::Rate r(1);

    //节点不死
    while (ros::ok())
    {
        //给消息赋值
        beep_msg.data = 0;
        //发布消息
        beep_pub.publish(beep_msg);
        //加入调试，打印发送的消息
        ROS_INFO("发送的消息:%d",beep_msg.data);

        //根据前面制定的发送贫频率自动休眠 休眠时间 = 1/频率；
        r.sleep();
        //暂无应用
        ros::spinOnce();
    }

    return 0;
}