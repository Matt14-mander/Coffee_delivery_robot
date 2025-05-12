/*  
　　　此程序通过通过动作编程实现由client发布一个目标距离
　　　然后控制小车运动目标距离的过程
 */
#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>
#include "move_action/Move_ActionAction.h"
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>

//重新定义动作变量类型。
typedef actionlib::SimpleActionServer<move_action::Move_ActionAction> Server;
 
//生成速度的消息类型。
ros::Publisher turtle_vel;

//定义参数存放距离信息。
double distance;

//回调函数获取距离信息
void posecallback(const nav_msgs::Odometry::ConstPtr& msg) 
{ 
  distance=msg->pose.pose.position.x; 
}
 
// 收到action的goal后调用该回调函数
void execute(const move_action::Move_ActionGoalConstPtr& goal, Server* as)
{
    //获取目标距离值
    double num = goal->num;
    //定义变量存放要运动到的距离
    double err_dis;
    //定义返回变量
    move_action::Move_ActionFeedback feedback;
    //定义速度变量
    geometry_msgs::Twist vel_msgs;
    //目标点是否到达标志位
    float break_flag;
    ROS_INFO("服务已经被激活");
    ROS_INFO("动作目标前进%.2f米",num);
    //目标位置计算
    err_dis = num + distance;
    while(1)
    {   
        //设定控制频率
        ros::Rate r(10);
        //设定运动速度
        vel_msgs.angular.z = 0;
        vel_msgs.angular.y = 0;
        vel_msgs.linear.x = 0.2; 
        //得到当前运动距离与目标运动距离差值
        break_flag = err_dis-distance;
        //发布速度话题
        turtle_vel.publish(vel_msgs);
        //计算当前进度
        feedback.progress_bar=(err_dis - distance)/num;
        //将当前进度传递给client端
        as->publishFeedback(feedback);
        //到达目标点后处理策略
        if(break_flag<0.01) 
        {
            //速度置0，退出循环
            vel_msgs.linear.x = 0;
            turtle_vel.publish(vel_msgs);
            break;
        }
        //空闲时间释放CPU
        r.sleep();
    }
        // 当action完成后，向客户端返回结果
        ROS_INFO("Success.");
        as->setSucceeded();
}
 
int main(int argc, char** argv)
{
    setlocale(LC_ALL,"");
    //初始化ROS节点;
    ros::init(argc, argv, "turtleMove");
    //创建NodeHandle;
    ros::NodeHandle nh;
    //订阅机器人的位置信息
    ros::Subscriber sub = nh.subscribe("/odom",10,&posecallback); 
    //发布控制机器人运动的速度
    turtle_vel = nh.advertise<geometry_msgs::Twist>("/cmd_vel",10);
    // 定义一个服务器
    Server server(nh, "Move_Action", boost::bind(&execute, _1, &server), false);
    // 服务器开始运行
    server.start();
    ROS_INFO("server has started.");
    ros::spin();
 
    return 0;
}
