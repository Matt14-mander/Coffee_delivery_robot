
#include <ros/ros.h>
#include <signal.h>
#include <stdlib.h>
#include <joint.h>
#include <std_msgs/String.h>
#include <std_msgs/Int8.h>
#include <geometry_msgs/Twist.h>
#include "geometry_msgs/PoseStamped.h"

using namespace std;

ros::Publisher cmdvel_pub;     //速度信息发布者
ros::Publisher beep_Publisher;     //速度信息发布者

geometry_msgs::Twist cmd_vel_msg;    //速度控制信息数据
std_msgs::Int8 beep_off;

int laser_follow_flag = 0;    //雷达跟随标志位
int laser_warning_flag = 0;    //雷达跟随标志位
int rrt_flag = 0;	  //自主建图标志位

/**************************************************************************
函数功能：雷达跟随开启成功标志位sub回调函数
入口参数：laser_follow_flag.msg  laser.py
返回  值：无
**************************************************************************/
void laser_follow_flagCallback(std_msgs::Int8 msg)
{
	laser_follow_flag = msg.data;
	
	if(laser_follow_flag == 1)
	{
		OTHER = (char*) "/follower_open.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);

		cout<<"雷达跟随打开成功"<<endl;
	}
	printf("%d\n",laser_follow_flag);
}

/**************************************************************************
函数功能：雷达跟随开启成功标志位sub回调函数
入口参数：laser_warning_flag.msg  follower.py
返回  值：无
**************************************************************************/
void laser_warning_flagCallback(std_msgs::Int8 msg)
{
	laser_warning_flag = msg.data;
	
	if(laser_warning_flag == 1)
	{
		OTHER = (char*) "/warning_open.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);

		cout<<"雷达警报打开成功"<<endl;
	}
	printf("%d\n",laser_warning_flag);
}



void voice_choose_callback(const std_msgs::String& msg)
{
	/***指令***/
    beep_off.data = 0;
	string str1 = msg.data.c_str();    //取传入数据
	string str2 = "关闭雷达跟随";
	string str3 = "关闭雷达警报";
	string str4 = "关闭导航";
	 
	if(str1 == str2)
	{
		system("rosnode kill /follower");
		cmd_vel_msg.linear.x = 0;
		cmd_vel_msg.angular.z = 0;
		cmdvel_pub.publish(cmd_vel_msg);
		OTHER = (char*) "/follower_close.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"已关闭雷达跟随"<<endl;
	}

	else if(str1 == str3)
	{
		system("rosnode kill /warning");
		cmd_vel_msg.linear.x = 0;
		cmd_vel_msg.angular.z = 0;
		cmdvel_pub.publish(cmd_vel_msg);
		beep_Publisher.publish(beep_off);
		OTHER = (char*) "/warning_close.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"已关闭雷达警报"<<endl;
	}



	else if(str1 == str4)
	{
		OTHER = (char*) "/close_2dnavigation.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		sleep(0.5);
		system("rosnode kill /move_base");
		system("rosnode kill /amcl");
		system("rosnode kill /map_server");
		system("rosnode kill /pose_init");
		cmd_vel_msg.linear.x = 0;
		cmd_vel_msg.angular.z = 0;
		cmdvel_pub.publish(cmd_vel_msg);
		cout<<"已关闭导航"<<endl;
	}

} 


int main(int argc, char** argv)
{

	ros::init(argc, argv, "feedback_node");  //初始化节点 

	ros::NodeHandle nha; //初始化句柄

	/***创建节点关闭判断语句订阅者***/

	ros::Subscriber voice_choose_sub = nha.subscribe("voice_words",1,voice_choose_callback);

	ros::Subscriber laser_follow_flag_sub = nha.subscribe("laser_follow_flag", 1, laser_follow_flagCallback);//雷达跟随开启标志位订阅

	ros::Subscriber laser_warning_flag_sub = nha.subscribe("laser_waring_flag", 1, laser_warning_flagCallback);//雷达警报开启标志位订阅

	nha.param("/node_feedback/audio_path", audio_path, std::string("/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/tarkbot_voice/xf_mic_asr_offline"));

    nha.param("/command_recognition/head", head, std::string("aplay -D plughw:CARD=UACDemoV10,DEV=0 "));

	/***创建关闭速度信息发布者***/
	cmdvel_pub = nha.advertise<geometry_msgs::Twist>("cmd_vel", 1);
	beep_Publisher = nha.advertise<std_msgs::Int8>("beep", 1);

	ros::spin();

	return 0;
	
}

