
#include <ros/ros.h>
#include <signal.h>
#include <string.h>
#include <iostream>
#include <std_msgs/Int8.h>
#include <stdlib.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PointStamped.h>


int use_time = 0 ;
int click_time = 0;

void start_build_map(geometry_msgs::PointStamped msg)
{
	click_time++;
}


void build_over_Callback(nav_msgs::Odometry msg)
{
	if(click_time > 4)
	{
		if(msg.twist.twist.linear.x < 0.005 && msg.twist.twist.angular.z < 0.005)
		{
			use_time++;
		}
		else 
		{
			use_time = 0;
		}
	}
}

int main(int argc, char** argv)
{

	ros::init(argc, argv, "map_over");    

	ros::NodeHandle nha;   
	
	ros::Subscriber speed_sub = nha.subscribe("/odom",1,build_over_Callback);

	ros::Publisher back_pub = nha.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",1);

	ros::Subscriber start_sub = nha.subscribe("/clicked_point",1,start_build_map);

	geometry_msgs::PoseStamped location;                                       //记录初始点

	int waiting_time ;
	ros::param::param<int>("/map_over/waiting_time", waiting_time, 60);


	location.header.seq = 0;
	location.header.frame_id = "map";
	location.pose.position.x = 0;
	location.pose.position.y = 0;
	location.pose.position.z = 0;
	location.pose.orientation.x = 0;
	location.pose.orientation.y = 0;
	location.pose.orientation.z = 0;
	location.pose.orientation.w = 1;


	double rate = 1;    
	ros::Rate loopRate(rate);

	while(ros::ok())
	{
		if(use_time == waiting_time)
		{
			system("dbus-launch gnome-terminal -- rosnode kill /assigner");
		}
		
		if(use_time == (waiting_time+5))
		{
			back_pub.publish(location);
			break;
		}

		printf("use_time=%d\n",use_time);
		ros::spinOnce();
		loopRate.sleep();      
	}
	return 0;


}


