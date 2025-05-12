/**************************************************************************
作者：caidx1
功能：命令控制器，命令词识别结果转化为对应的执行动作
**************************************************************************/
#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <std_msgs/String.h>
#include <iostream>
#include <stdio.h>
#include <joint.h>
#include <std_msgs/Int8.h>
#include <geometry_msgs/PoseStamped.h>
#include <stdlib.h>

using namespace std;
ros::Publisher vel_pub;    //创建底盘运动话题发布者
ros::Publisher cmd_vel_pub;
ros::Publisher goal_control_pub;
ros::Publisher follow_flag_pub;    //创建寻找声源标志位话题发布者
ros::Publisher cmd_vel_flag_pub;    //创建底盘运动控制器标志位话题发布者
ros::Publisher far_away_pub;    //创建避障标志位话题发布者
ros::Publisher awake_flag_pub;    //创建唤醒标志位话题发布者
ros::Publisher navigation_auto_pub;    //创建自主导航目标点话题发布者
geometry_msgs::Twist cmd_msg;    //底盘运动话题消息数据
geometry_msgs::PoseStamped target;    //导航目标点消息数据
int voice_flag = 0;    //寻找标志位
int voice_open_off = 0;
int goal_control=0;
string device;
string play_voice;
string voice;

float I_position_x ;
float I_position_y ;
float I_orientation_z ;
float I_orientation_w ;

float J_position_x ;
float J_position_y ;
float J_orientation_z ;
float J_orientation_w ;

float K_position_x ;
float K_position_y ;
float K_orientation_z ;
float K_orientation_w ;

float line_vel_x ;
float ang_vel_z ;
float turn_line_vel_x ;
 
/**************************************************************************
函数功能：离线命令词识别结果sub回调函数
入口参数：命令词字符串  voice_control.cpp等
返回  值：无
**************************************************************************/
void voice_words_callback(const std_msgs::String& msg)
{
	/***指令***/
	string str1 = msg.data.c_str();    //取传入数据
	string str2 = "小克前进";
	string str3 = "小克后退"; 
	string str4 = "小克左转";
	string str5 = "小克右转";
	string str6 = "小克停止";
	string str7 = "小克休眠";
	string str8 = "小克过来";
	string str9 = "小克去1点";
	string str10 = "小克去2点";
	string str11 = "小克去3点";
	string str12 = "失败5次";
	string str13 = "失败10次";
	string str14 = "遇到障碍物";
	string str15 = "小克唤醒";
	string str16 = "小克雷达跟随";
	string str17 = "小克脱困";
	string str18 = "语音休眠";
	string str19 = "小克开始导航";
	string str20 = "小克雷达警报";
	string str21 = "小克来点东北话";
	string str22 = "小克来点四川话";
	string str23 = "小克来点粤语";
	string str24 = "小克播放音乐";
/***********************************
指令：前进
动作：底盘运动控制器使能，发布速度指令
***********************************/
	if(str1 == str2)
	{
		cmd_msg.linear.x = line_vel_x;
		cmd_msg.angular.z = 0;
		vel_pub.publish(cmd_msg);

		std_msgs::Int8 cmd_vel_flag_msg;
    	cmd_vel_flag_msg.data = 1;
    	cmd_vel_flag_pub.publish(cmd_vel_flag_msg);
    	OTHER = (char*) "/front.WAV";//语音反馈
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：前进"<<endl;
	}
/***********************************
指令：后退
动作：底盘运动控制器使能，发布速度指令
***********************************/
	else if(str1 == str3)
	{
		cmd_msg.linear.x = -line_vel_x;
		cmd_msg.angular.z = 0;
		vel_pub.publish(cmd_msg);

		std_msgs::Int8 cmd_vel_flag_msg;
        cmd_vel_flag_msg.data = 1;
        cmd_vel_flag_pub.publish(cmd_vel_flag_msg);
        OTHER = (char*) "/back.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：后退"<<endl;
	}
/***********************************
指令：左转
动作：底盘运动控制器使能，发布速度指令
***********************************/
	else if(str1 == str4)
	{
		cmd_msg.linear.x = turn_line_vel_x;
		cmd_msg.angular.z = ang_vel_z;
		vel_pub.publish(cmd_msg);

		std_msgs::Int8 cmd_vel_flag_msg;
        cmd_vel_flag_msg.data = 1;
        cmd_vel_flag_pub.publish(cmd_vel_flag_msg);
        OTHER = (char*) "/turn_left.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);        
		cout<<"好的：左转"<<endl;
	}
/***********************************
指令：右转
动作：底盘运动控制器使能，发布速度指令
***********************************/
	else if(str1 == str5)
	{
		cmd_msg.linear.x = turn_line_vel_x;
		cmd_msg.angular.z = -ang_vel_z;
		vel_pub.publish(cmd_msg);

		std_msgs::Int8 cmd_vel_flag_msg;
        cmd_vel_flag_msg.data = 1;
        cmd_vel_flag_pub.publish(cmd_vel_flag_msg);
        OTHER = (char*) "/turn_right.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：右转"<<endl;
	}
/***********************************
指令：停
动作：底盘运动控制器失能，发布速度空指令
***********************************/
	else if(str1 == str6)
	{
		cmd_msg.linear.x = 0;
		cmd_msg.angular.z = 0;
		vel_pub.publish(cmd_msg);


		std_msgs::Int8 cmd_vel_flag_msg;
        cmd_vel_flag_msg.data = 1;
        cmd_vel_flag_pub.publish(cmd_vel_flag_msg);
        OTHER = (char*) "/stop.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：停"<<endl;
	}
/***********************************
指令：休眠
动作：底盘运动控制器失能，发布速度空指令，唤醒标志位置零
***********************************/
	else if(str1 == str7)
	{
		cmd_msg.linear.x = 0;
		cmd_msg.angular.z = 0;
		vel_pub.publish(cmd_msg);

		std_msgs::Int8 awake_flag_msg;
        awake_flag_msg.data = 0;
        awake_flag_pub.publish(awake_flag_msg);

        std_msgs::Int8 cmd_vel_flag_msg;
        cmd_vel_flag_msg.data = 1;
        cmd_vel_flag_pub.publish(cmd_vel_flag_msg);
        OTHER = (char*) "/sleep.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"休眠，等待下一次唤醒"<<endl;
	}
/***********************************
指令：过来
动作：寻找声源标志位置位
***********************************/
	else if(str1 == str8)
	{
		std_msgs::Int8 follow_flag_msg;
		follow_flag_msg.data = 1;
		follow_flag_pub.publish(follow_flag_msg);
		OTHER = (char*) "/search_voice.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：寻找声源"<<endl;
	}
/***********************************
指令：去I点
动作：底盘运动控制器失能(导航控制)，发布目标点
***********************************/
	else if(str1 == str9)
	{
		target.pose.position.x = I_position_x;
		target.pose.position.y = I_position_y;
		target.pose.orientation.z = I_orientation_z;
		target.pose.orientation.w = I_orientation_w;
		navigation_auto_pub.publish(target);

		std_msgs::Int8 cmd_vel_flag_msg;
        cmd_vel_flag_msg.data = 0;
        cmd_vel_flag_pub.publish(cmd_vel_flag_msg);
        
        std_msgs::Int8 goal_control_flag_msg;
        goal_control_flag_msg.data = 1;
        goal_control_pub.publish(goal_control_flag_msg);
        OTHER = (char*) "/fist_goal.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：自主导航至1点"<<endl;
		
	}
/***********************************
指令：去I点
动作：底盘运动控制器失能(导航控制)，发布目标点
***********************************/
	else if(str1 == str10)
	{
		target.pose.position.x = J_position_x;
		target.pose.position.y = J_position_y;
		target.pose.orientation.z = J_orientation_z;
		target.pose.orientation.w = J_orientation_w;
		navigation_auto_pub.publish(target);

		std_msgs::Int8 cmd_vel_flag_msg;
        cmd_vel_flag_msg.data = 0;
        cmd_vel_flag_pub.publish(cmd_vel_flag_msg);

        std_msgs::Int8 goal_control_flag_msg;
        goal_control_flag_msg.data = 1;
        goal_control_pub.publish(goal_control_flag_msg);
       	OTHER = (char*) "/second_goal.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：自主导航至2点"<<endl;
	}
/***********************************
指令：去K点
动作：底盘运动控制器失能(导航控制)，发布目标点
***********************************/
	else if(str1 == str11)
	{
		target.pose.position.x = K_position_x;
		target.pose.position.y = K_position_y;
		target.pose.orientation.z = K_orientation_z;
		target.pose.orientation.w = K_orientation_w;
		navigation_auto_pub.publish(target);

		std_msgs::Int8 cmd_vel_flag_msg;
        cmd_vel_flag_msg.data = 0;
        cmd_vel_flag_pub.publish(cmd_vel_flag_msg);

        std_msgs::Int8 goal_control_flag_msg;
        goal_control_flag_msg.data = 1;
        goal_control_pub.publish(goal_control_flag_msg);
       	OTHER = (char*) "/third_goal.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：自主导航至3点"<<endl;
	}
/***********************************
辅助指令：失败5次
动作：用户界面打印提醒
***********************************/
	else if(str1 == str12)
	{
		cout<<"您已经连续【输入空指令or识别失败】5次，累计达15次自动进入休眠，输入有效指令后计数清零"<<endl;
	}
/***********************************
辅助指令：失败10次
动作：用户界面打印提醒
***********************************/
	else if(str1 == str13)
	{
		cout<<"您已经连续【输入空指令or识别失败】10次，累计达15次自动进入休眠，输入有效指令后计数清零"<<endl;
	}
/***********************************
辅助指令：遇到障碍物
动作：用户界面打印提醒
***********************************/
	else if(str1 == str14)
	{
		OTHER = (char*) "/Tracker.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"遇到障碍物，已停止运动"<<endl;
	}
/***********************************
辅助指令：唤醒
动作：用户界面打印提醒
***********************************/
	else if(str1 == str15)
	{
		OTHER = (char*) "/hello.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"已被唤醒，请说语音指令"<<endl;
		
	}
	

	else if(str1 == str16)
	{
		OTHER = (char*) "/OK.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		system("dbus-launch gnome-terminal -- roslaunch xf_mic_asr_offline tarkbot_laser_follower_voice.launch");//打开雷达跟随节点
		cout<<"好的：雷达跟随"<<endl;
	}

	else if(str1 == str17)
	{
		std_msgs::Int8 far_away_msg;
		far_away_msg.data = 1;
		far_away_pub.publish(far_away_msg);
		OTHER = (char*) "/far_away.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		system("rosnode kill /follower");
		cout<<"好的：寻找声源"<<endl;
	}
	/***********************************
	辅助指令：失败15次
	动作：用户界面打印提醒
	***********************************/
	else if(str1 == str18)
	{
		OTHER = (char*) "/sleeped.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"语音模块进入被动休眠状态"<<endl;
	}
	else if(str1 == str19)
	{
		OTHER = (char*) "/2dnavigation.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		system("rosnode kill /move_base");
		system("rosnode kill /amcl");
		system("rosnode kill /map_server");
		system("rosnode kill /pose_init");
		system("dbus-launch gnome-terminal -- roslaunch xf_mic_asr_offline navigation.launch");//打开导航节点
		cout<<"好的：开始导航"<<endl;
	}
	else if(str1 == str20)
	{
		OTHER = (char*) "/OK.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		system("dbus-launch gnome-terminal -- roslaunch xf_mic_asr_offline tarkbot_laser_warning_voice.launch");//打开雷达跟随节点
		cout<<"好的：雷达警报"<<endl;
	}
	else if(str1 == str21)
	{
		OTHER = (char*) "/dongbeifangyan.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：说东北方言"<<endl;
	}
	else if(str1 == str22)
	{
		OTHER = (char*) "/sichuanfangyan.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：说四川方言"<<endl;
	}
	else if(str1 == str23)
	{
		OTHER = (char*) "/yueyufangyan.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：说粤语"<<endl;
	}
	else if(str1 == str24)
	{
		OTHER = (char*) "/music.WAV";
		WHOLE = join((head + audio_path),OTHER);
		system(WHOLE);
		cout<<"好的：播放音乐"<<endl;
	}
}




/**************************************************************************
函数功能：寻找语音开启成功标志位sub回调函数
入口参数：voice_flag_msg  voice_control.cpp
返回  值：无
**************************************************************************/
void voice_flag_Callback(std_msgs::Int8 msg)
{
	voice_flag = msg.data;
	OTHER = (char*) "/voice_open.WAV";
	WHOLE = join((head + audio_path),OTHER);
	if(voice_flag == 1 && !voice_open_off)
	{
		system(WHOLE);
		voice_open_off = 1;
		cout<<"语音打开成功"<<endl;
	}

}

/**************************************************************************
函数功能：主函数
入口参数：无
返回  值：无
**************************************************************************/
int main(int argc, char** argv)
{

	ros::init(argc, argv, "cmd_rec");     //初始化ROS节点

	ros::NodeHandle n;    //创建句柄
	
	string if_akm;
	
	/***创建寻找声源标志位话题发布者***/
	follow_flag_pub = n.advertise<std_msgs::Int8>("follow_flag",1);

	/***创建I、J、K点到达标志位话题发布者***/
	goal_control_pub = n.advertise<std_msgs::Int8>("goal_control_flag",1);

	/***创建底盘运动控制器标志位话题发布者***/
	cmd_vel_flag_pub = n.advertise<std_msgs::Int8>("cmd_vel_flag",1);

	/***创建底盘运动控制器标志位话题发布者***/
	far_away_pub = n.advertise<std_msgs::Int8>("far_away_flag",1);

	/***创建底盘运动话题发布者***/
	vel_pub = n.advertise<geometry_msgs::Twist>("ori_vel",1);

	cmd_vel_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 1);

	/***创建唤醒标志位话题发布者***/
	awake_flag_pub = n.advertise<std_msgs::Int8>("awake_flag", 1);

  /***创建自主导航目标点话题发布者***/
	navigation_auto_pub = n.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",1);

	/***创建离线命令词识别结果话题订阅者***/
	ros::Subscriber voice_words_sub = n.subscribe("voice_words",1,voice_words_callback);

	/***创建寻找语音开启标志位话题订阅者***/
	ros::Subscriber voice_flag_sub = n.subscribe("voice_flag", 1, voice_flag_Callback);

	n.param("/command_recognition/audio_path", audio_path, std::string("~/catkin_ws1111/src/xf_mic_asr_offline"));
	n.param("/command_recognition/head", head, std::string("aplay -D plughw:CARD=UACDemoV10,DEV=0 "));


	n.param<float>("/1_position_x", I_position_x, 1);
	n.param<float>("/1_position_y", I_position_y, 0);
	n.param<float>("/1_orientation_z", I_orientation_z, 0);
	n.param<float>("/1_orientation_w", I_orientation_w, 1);
	n.param<float>("/2_position_x", J_position_x, 2);
	n.param<float>("/2_position_y", J_position_y, 0);
	n.param<float>("/2_orientation_z", J_orientation_z, 0);
	n.param<float>("/2_orientation_w", J_orientation_w, 1);
	n.param<float>("/3_position_x", K_position_x, 3);
	n.param<float>("/3_position_y", K_position_y, 0);
	n.param<float>("/3_orientation_z", K_orientation_z, 0);
	n.param<float>("/3_orientation_w", K_orientation_w, 1);
	n.param<float>("/line_vel_x", line_vel_x, 0.2);
	n.param<float>("/ang_vel_z", ang_vel_z, 0.2);
	n.param("/if_akm_yes_or_no", if_akm, std::string("no"));

	if(if_akm == "yes")
		turn_line_vel_x = 0.2;
	else 
		turn_line_vel_x = 0;

	/***自主导航目标点数据初始化***/
	target.header.seq = 0;
	//target.header.stamp;
	target.header.frame_id = "map";
	target.pose.position.x = 0;
	target.pose.position.y = 0;
	target.pose.position.z = 0;
	target.pose.orientation.x = 0;
	target.pose.orientation.y = 0;
	target.pose.orientation.z = 0;
	target.pose.orientation.w = 1;


  /***用户界面***/
	sleep(7);
	printf("<--             塔克机器人语音控制命令          -->\r\n");
	printf("<--              唤醒词:\033[32m你好小克\033[0m    -->\r\n");
	printf("<--        \033[32m小克前进\033[0m      ---> 机器人前进        -->\r\n");
	printf("<--        \033[32m小克后退\033[0m      ---> 机器人后退        -->\r\n");
	printf("<--        \033[32m小克左转\033[0m      ---> 机器人左转        -->\r\n");
	printf("<--        \033[32m小克右转\033[0m      ---> 机器人右转        -->\r\n");
	printf("<--        \033[32m小克停止\033[0m      ---> 机器人停止        -->\r\n");
	printf("<--        \033[32m小克休眠\033[0m      ---> 机器人休眠        -->\r\n");
	printf("<--        \033[32m小克过来\033[0m      ---> 机器人寻找声源     -->\r\n");
	printf("<--        \033[32m小克去1点\033[0m     ---> 机器人导航到1点    -->\r\n");
	printf("<--        \033[32m小克去2点\033[0m     ---> 机器人导航到2点    -->\r\n");
	printf("<--        \033[32m小克去3点\033[0m     ---> 机器人导航到3点    -->\r\n");
	printf("<--        \033[32m小克雷达跟随\033[0m   ---> 机器人雷达跟随     -->\r\n");
	printf("<--        \033[32m小克脱困\033[0m      --->  机器人脱困        -->\r\n");
	printf("<--        \033[32m小克雷达警报\033[0m   ---> 机器人雷达警报     -->\r\n");
	printf("<--        \033[32m小克来点东北话\033[0m ---> 机器人说东北话     -->\r\n");
	printf("<--        \033[32m小克来点四川话\033[0m ---> 机器人说四川话     -->\r\n");
	printf("<--        \033[32m小克来点粤语\033[0m   ---> 机器人说粤语       -->\r\n");
	printf("<--        \033[32m小克播放音乐\033[0m   ---> 机器人播放音乐     -->\r\n");
	cout<<"\n"<<endl;

	ros::spin();
}

