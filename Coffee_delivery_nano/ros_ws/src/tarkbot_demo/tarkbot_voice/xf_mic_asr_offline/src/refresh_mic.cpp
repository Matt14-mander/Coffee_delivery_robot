#include <ros/ros.h>
#include <signal.h>
#include <xf_mic_asr_offline/Set_Major_Mic_srv.h>
#include <string.h>
#include <cmath>
#include <iostream>
#include <std_msgs/Int32.h>
#include <std_msgs/Int8.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>

double orientation_z;    
double orientation_w;
double direction_r;
double direction;
double angle = 0;    
double last_direction = 0;
int awake_flag = 0;    
int last_mic=0;   
ros::ServiceClient Set_Major_Mic_client;    
ros::Publisher current_angle_pub;    



void angle_Callback(std_msgs::Int32 msg)
{
	angle = msg.data;    

	if(angle>=30 && angle<=90)    
		last_mic = 1;
	else if(angle>=90 && angle<=150)
		last_mic = 2;
	else if(angle>=150 && angle<=210)
		last_mic = 3;
	else if(angle>=210 && angle<=270)
		last_mic = 4;
	else if(angle>=270 && angle<=330)
		last_mic = 5;
	else
		last_mic = 0;
	printf("last_mic_init = %d-----\n",last_mic);

}


void awake_flag_Callback(std_msgs::Int8 msg)
{	
	last_direction = direction;
	awake_flag = msg.data;
	printf("awake_flag = %d\n",awake_flag);
	
}
 
void pose_callback(const geometry_msgs::PoseWithCovarianceStamped& msg)
{
	orientation_z = msg.pose.pose.orientation.z;   
	orientation_w = msg.pose.pose.orientation.w;

	printf("z = %f-----\n",orientation_z);
	printf("w = %f-----\n",orientation_w);
	direction_r = atan2(2*(orientation_w*orientation_z),1-2*(pow(orientation_z,2.0)));

	direction = direction_r*180/3.1415926;
	if(direction<0)
		{direction+=360;}
		


	if(awake_flag)    
	{


		double dire_error = direction-last_direction;    
		angle+=dire_error;    
		last_direction = direction;   
		
		if(angle > 360)    
			angle-=360;
		else if(angle < 0) 
			angle+=360;
		
		std_msgs::Int32 current_angle_msg;
		current_angle_msg.data = int(angle);
		current_angle_pub.publish(current_angle_msg);    

		xf_mic_asr_offline::Set_Major_Mic_srv num;
		if(angle>=30 && angle<=90)    
			num.request.mic_id = 1;
		else if(angle>=90 && angle<=150)
			num.request.mic_id = 2;
		else if(angle>=150 && angle<=210)
			num.request.mic_id = 3;
		else if(angle>=210 && angle<=270)
			num.request.mic_id = 4;
		else if(angle>=270 && angle<=330)
			num.request.mic_id = 5;
		else
			num.request.mic_id = 0;

		if(last_mic != num.request.mic_id)    
		{
			Set_Major_Mic_client.call(num);
			last_mic = num.request.mic_id;

		}
	}
}
int main(int argc, char** argv)
{

	ros::init(argc, argv, "ref_mic");    

	ros::NodeHandle node;   

	current_angle_pub = node.advertise<std_msgs::Int32>("current_angle",1);

	ros::Subscriber angle_sub = node.subscribe("/mic/awake/angle", 1, angle_Callback);

	ros::Subscriber awake_flag_sub = node.subscribe("awake_flag", 1, awake_flag_Callback);

	ros::Subscriber pose_sub = node.subscribe("/robot_pose_ekf/odom_combined",1,pose_callback);

	Set_Major_Mic_client = node.serviceClient<xf_mic_asr_offline::Set_Major_Mic_srv>("xf_asr_offline_node/set_major_mic_srv");
	
	double rate2 = 5;    
	ros::Rate loopRate2(rate2);

	while(ros::ok())
	{
	ros::spinOnce();
	loopRate2.sleep();    
	}
	return 0;

}

