#include <com_mic.h>
#include <ros/ros.h>
#include <iostream>
#include <string.h>
#include <record.h>
#include "jsoncpp/json/json.h"
#include <std_msgs/Int32.h>
#include <std_msgs/Int8.h>
#include <std_msgs/String.h>

using namespace std;

ros::Publisher awake_flag_pub;
ros::Publisher voice_flag_pub;
ros::Publisher voice_words_pub;
ros::Publisher pub_awake_angle;

std::string awake_flag = "awake_flag";
std::string voice_flag = "voice_flag";
std::string voice_words = "voice_words";
std::string awake_angle_topic = "/mic/awake/angle";
string usart_port_name;

unsigned char Receive_Data[1024] = {0};
int angle_int = 0;
int if_awake = 0;

char awake_words[64] = "你好小克";

int deal_with(unsigned char buffer)
{
	static int count=0, frame_len=0, msg_id=0;
	Receive_Data[count] = buffer;
    if(Receive_Data[0] != FRAME_HEADER || (count == 1 && Receive_Data[1] != USER_ID))  //frame header and user id
      count = 0,frame_len = 0, msg_id = 0;
    else 
      count++;
	if (count == 7){  //length and msg id
      msg_id = data_trans(Receive_Data[6], Receive_Data[5]);
      frame_len = data_trans(Receive_Data[4], Receive_Data[3]) + 7 + 1;
	}
	if(count == frame_len){
		char str[1024] = {0};
		switch(Receive_Data[2]){
			case 0X01:
			/*
				if(check_sum(frame_len-1) == Receive_Data[frame_len-1]){
					for(int i=0; i<frame_len; i++){
						printf("%x ", Receive_Data[i]);
					}
					printf("\n");
				}
				else{
					printf("check failed !\n");
				}
				*/
				break;
			
			case 0X04:
				if(check_sum(frame_len-1) == Receive_Data[frame_len-1]){
					if_awake = 1;
                    record_finish = 1;
					for(int i=0; i<frame_len-8; i++){
						str[i] = Receive_Data[i+7];
					}
					//printf("%s\n", str);
					//printf("check = %x \n", check_sum(frame_len-1));

					Json::Reader reader;
					Json::Value value;
					Json::Value value_iwv;

				    if(reader.parse(str,value))
				    {
				    	Json::Value content = value["content"];
				    	std::string iwv_msg = content["info"].asString();
				    	//cout << "iwv_msg is " << iwv_msg << endl;

				    	if (reader.parse(iwv_msg,value_iwv))
				    	{
				    		angle_int = value_iwv["ivw"]["angle"].asInt();
				    		//cout << "angle is " << angle_int << endl;
				    	}
				    }
				    else{
				    	 cout << "reader json fail!"<< endl;
				    }

				}
				else{
					printf("check failed !\n");
				}
				break;
				
			default:
				break;
		}
		
		count = 0,frame_len = 0, msg_id = 0;
		memset(Receive_Data, 0, 1024);
	}
	return 0;
}

unsigned char check_sum(int count_num)
{
	unsigned char check_sum = 0;
	for(int i=0; i<count_num; i++){
		check_sum = check_sum + Receive_Data[i];
	}
	return ~check_sum+1;
}


short data_trans(unsigned char data_high, unsigned char data_low)
{
	short transition_16;
	transition_16 = 0;
	transition_16 |=  data_high<<8;   
	transition_16 |=  data_low;
	return transition_16;
}

int open_port(const char* uartname)
{
    int fd = open(uartname, O_RDWR|O_NOCTTY|O_NONBLOCK);
    if (-1 == fd)
    {
        perror("Can't Open Serial Port");
        return(-1);
    }
     /*恢复串口为阻塞状态*/
     if(fcntl(fd, F_SETFL, 0)<0)
     {
            printf("fcntl failed!\n");
     }else{
        //printf("fcntl=%d\n",fcntl(fd, F_SETFL,0));
     }
     /*测试是否为终端设备*/
     if(isatty(STDIN_FILENO)==0)
     {
        printf("standard input is not a terminal device\n");
     }
     else
     {
        //printf("isatty success!\n");
     }
     //printf("fd-open=%d\n",fd);
     return fd;
}


int set_opt(int fd,int nSpeed, int nBits, unsigned char nEvent, int nStop)
{
    struct termios newtio,oldtio;
    if  ( tcgetattr( fd,&oldtio)  !=  0) {
        perror("SetupSerial 1");
        return -1;
    }
    bzero( &newtio, sizeof( newtio ) );
    newtio.c_cflag  |=  CLOCAL | CREAD;
    newtio.c_cflag &= ~CSIZE;

    switch( nBits )
    {
    case 7:
        newtio.c_cflag |= CS7;
        break;
    case 8:
        newtio.c_cflag |= CS8;
        break;
    }

    switch( nEvent )
    {
    case 'O':
        newtio.c_cflag |= PARENB;
        newtio.c_cflag |= PARODD;
        newtio.c_iflag |= (INPCK | ISTRIP);
        break;
    case 'E':
        newtio.c_iflag |= (INPCK | ISTRIP);
        newtio.c_cflag |= PARENB;
        newtio.c_cflag &= ~PARODD;
        break;
    case 'N':
        newtio.c_cflag &= ~PARENB;
        break;
    }

    switch( nSpeed )
    {
    case 2400:
        cfsetispeed(&newtio, B2400);
        cfsetospeed(&newtio, B2400);
        break;
    case 4800:
        cfsetispeed(&newtio, B4800);
        cfsetospeed(&newtio, B4800);
        break;
    case 9600:
        cfsetispeed(&newtio, B9600);
        cfsetospeed(&newtio, B9600);
        break;
    case 115200:
        cfsetispeed(&newtio, B115200);
        cfsetospeed(&newtio, B115200);
        break;
    case 460800:
        cfsetispeed(&newtio, B460800);
        cfsetospeed(&newtio, B460800);
        break;
    case 921600:
        printf("B921600\n");
        cfsetispeed(&newtio, B921600);
                cfsetospeed(&newtio, B921600);
        break;
    default:
        cfsetispeed(&newtio, B9600);
        cfsetospeed(&newtio, B9600);
        break;
    }
    if( nStop == 1 )
        newtio.c_cflag &=  ~CSTOPB;
    else if ( nStop == 2 )
    newtio.c_cflag |=  CSTOPB;
    newtio.c_cc[VTIME]  = 0;
    newtio.c_cc[VMIN] = 0;
    tcflush(fd,TCIFLUSH);
    if((tcsetattr(fd,TCSANOW,&newtio))!=0)
    {
        perror("com set error");
        return -1;
    }
  //printf("set done!\n\r");
    return 0;
}
/**************************************************************************
函数功能：主函数
入口参数：无
返回  值：无
**************************************************************************/
int main(int argc, char** argv)
{

	ros::init(argc, argv, "tarkbot_mic");    //初始化ROS节点

	ros::NodeHandle node;    //创建句柄

	/***创建唤醒标志位话题发布者***/
	awake_flag_pub = node.advertise<std_msgs::Int8>(awake_flag,1);

	/***创建麦克风设备串口打开话题发布者***/
	voice_flag_pub = node.advertise<std_msgs::Int8>(voice_flag, 1);

	/***创建命令词话题发布者***/
	voice_words_pub = node.advertise<std_msgs::String>(voice_words, 1);

	/*　topic 发布唤醒角度*/
	pub_awake_angle = node.advertise<std_msgs::Int32>(awake_angle_topic, 1);

	ros::NodeHandle private_n("~");

	private_n.param<std::string>("usart_port_name",  usart_port_name,  "/dev/tarkbot_mic");

	int fd=1, read_num = 0;
    unsigned char buffer[1];
    memset(buffer, 0, 1);
    const char* uartname = usart_port_name.c_str();
    //printf("uartname is %s\n",uartname);
    if((fd=open_port(uartname))<0)
    {
         printf("open %s is failed\n",uartname);
         printf(">>>>>无法打开麦克风设备，尝试重新连接进行测试\n");
         return 0;
    }
    else{
            set_opt(fd, 115200, 8, 'N', 1);
            printf(">>>>>成功打开麦克风设备\n");
            printf(">>>>>唤醒词:\"%s!\"\n",awake_words);
            //printf("set_opt fd=%d\n",fd);

            for (int i = 0; i < 2; ++i)
            {
                std_msgs::Int8 voice_flag_msg;
                voice_flag_msg.data = 1;
                voice_flag_pub.publish(voice_flag_msg);
                //printf(">>>>>voice_flag_msg:%d\n", voice_flag_msg.data);
                sleep(1.0);
            }

        }
        

	while(ros::ok())
	{
		memset(buffer, 0, 1);
		read_num = read(fd, buffer, 1);
		if(read_num>0){	
			deal_with(buffer[0]);
        }

        if(if_awake)
        {

        	printf(">>>>>唤醒角度为:%d\n", angle_int);
            
    		std_msgs::Int32 awake_angle;
			awake_angle.data = angle_int;
			pub_awake_angle.publish(awake_angle);

            std_msgs::Int8 awake_flag_msg;
			awake_flag_msg.data = 1;
			awake_flag_pub.publish(awake_flag_msg);

			std_msgs::String msg;
			msg.data = "小克唤醒";
			voice_words_pub.publish(msg);

			sleep(0.8);
			if_awake = 0;
		} 
		ros::spinOnce(); 
		//ros::spin();     
	}
	return 0;

}