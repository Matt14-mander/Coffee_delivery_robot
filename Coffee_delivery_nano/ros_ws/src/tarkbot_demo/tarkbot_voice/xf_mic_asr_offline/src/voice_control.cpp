/*******************************************************
 This contents of this file may be used by anyone
 for any reason without any conditions and may be
 used as a starting point for your own applications
 which use HIDAPI.
********************************************************/
#include <user_interface.h>
#include <string>
#include <locale>
#include <codecvt>
#include <ctime>
#include <joint.h>
#include <record.h>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <xf_mic_asr_offline/Get_Offline_Result_srv.h>

#include <std_msgs/Int8.h>
#include <std_msgs/Int32.h>
#include <sys/stat.h>


ros::Publisher voice_words_pub;
ros::Publisher awake_flag_pub;
ros::Publisher voice_flag_pub;

std::string voice_words = "voice_words";

std::string voice_flag = "voice_flag";

std::string awake_flag = "awake_flag";

int offline_recognise_switch = 0; //离线识别默认开关

using namespace std;

extern UserData asr_data;
extern int whether_finised ;
extern char *whole_result;
int set_led_id ;

extern int init_rec;
extern int init_success;
extern int write_first_data;

unsigned char* record_data;

std::wstring s2ws(const std::string &str)
{
	using convert_typeX = std::codecvt_utf8<wchar_t>;
	std::wstring_convert<convert_typeX, wchar_t> converterX;

	return converterX.from_bytes(str);
}

std::string ws2s(const std::wstring &wstr)
{
	using convert_typeX = std::codecvt_utf8<wchar_t>;
	std::wstring_convert<convert_typeX, wchar_t> converterX;

	return converterX.to_bytes(wstr);
}

/*用于送入音频进行识别 (line)*/
int business_data(unsigned char* record)
{
    record_data = record;
    if (!init_success && init_rec)
    {
        int len = 3*PCM_MSG_LEN;
        char *pcm_buffer=(char *)malloc(len);
        if (NULL == pcm_buffer)
            {
                printf(">>>>>buffer is null\n");
                exit (1);
            }
        memcpy(pcm_buffer, record_data, len);

        if (write_first_data++ == 0)
        {
    #if whether_print_log
            printf("***************write the first voice**********\n");
    #endif
            demo_xf_mic(pcm_buffer, len, 1);
        }

        else
        {
    #if whether_print_log
            printf("***************write the middle voice**********\n");
    #endif
            demo_xf_mic(pcm_buffer, len, 2);
        }
        if (whether_finised)
        {
            record_finish = 1;
            whether_finised = 0;
        }
    }   
}


/*用于显示离线命令词识别结果*/
Effective_Result show_result(char *string) //
{
	Effective_Result current;
	if (strlen(string) > 250)
	{
		char asr_result[32];	//识别到的关键字的结果
		char asr_confidence[3]; //识别到的关键字的置信度
		char *p1 = strstr(string, "<rawtext>");
		char *p2 = strstr(string, "</rawtext>");
		int n1 = p1 - string + 1;
		int n2 = p2 - string + 1;

		char *p3 = strstr(string, "<confidence>");
		char *p4 = strstr(string, "</confidence>");
		int n3 = p3 - string + 1;
		int n4 = p4 - string + 1;
		for (int i = 0; i < 32; i++)
		{
			asr_result[i] = '\0';
		}

		strncpy(asr_confidence, string + n3 + strlen("<confidence>") - 1, n4 - n3 - strlen("<confidence>"));
		asr_confidence[n4 - n3 - strlen("<confidence>")] = '\0';
		int confidence_int = 0;
		confidence_int = atoi(asr_confidence);
		if (confidence_int >= confidence)
		{
			strncpy(asr_result, string + n1 + strlen("<rawtext>") - 1, n2 - n1 - strlen("<rawtext>"));
			asr_result[n2 - n1 - strlen("<rawtext>")] = '\0'; //加上字符串结束符。
		}
		else
		{
			strncpy(asr_result, "", 0);
		}

		current.effective_confidence = confidence_int;
		strcpy(current.effective_word, asr_result);
		return current;
	}
	else
	{
		current.effective_confidence = 0;
		strcpy(current.effective_word, " ");
		return current;
	}
}

/*获取离线命令词识别结果*/
bool Get_Offline_Recognise_Result(xf_mic_asr_offline::Get_Offline_Result_srv::Request &req,
								  xf_mic_asr_offline::Get_Offline_Result_srv::Response &res)
{
	char *denoise_sound_path = join(source_path, DENOISE_SOUND_PATH);
	offline_recognise_switch = req.offline_recognise_start;
	if (offline_recognise_switch == 1) //如果是离线识别模式
	{
		whether_finised = 0;
		record_finish = 0;
		int ret = 0;
		ret = create_asr_engine(&asr_data);
		if (MSP_SUCCESS != ret)
		{
#if whether_print_log
			printf("[01]创建语音识别引擎失败！\n");
#endif
		}

		printf(">>>>>开始一次语音识别！\n");
		get_the_record_sound(denoise_sound_path);

		if (whole_result!="")
		{
			//printf(">>>>>全部返回结果:　[ %s ]\n", whole_result);
			Effective_Result effective_ans = show_result(whole_result);
			if (effective_ans.effective_confidence >= confidence) //如果大于置信度阈值则进行显示或者其他控制操作
			{
				printf(">>>>>是否识别成功:　 [ %s ]\n", "是");
				printf(">>>>>关键字的置信度: [ %d ]\n", effective_ans.effective_confidence);
				printf(">>>>>关键字识别结果: [ %s ]\n", effective_ans.effective_word);
				/*发布结果*/
				//control_jetbot(effective_ans.effective_word);
				res.result = "ok";
				res.fail_reason = "";
				std::wstring wtxt = s2ws(effective_ans.effective_word);
				std::string txt_uft8 = ws2s(wtxt);
				res.text = txt_uft8;
				
				std_msgs::String msg;
				msg.data = effective_ans.effective_word;
				voice_words_pub.publish(msg);
				
			}
			else
			{
				printf(">>>>>是否识别成功:　[ %s ]\n", "否");
				printf(">>>>>关键字的置信度: [ %d ]\n", effective_ans.effective_confidence);
				printf(">>>>>关键字置信度较低，文本不予显示\n");
				res.result = "fail";
				res.fail_reason = "low_confidence error or 11212_license_expired_error";
				res.text = " ";
			}
		}
		else
		{
			res.result = "fail";
			res.fail_reason = "no_valid_sound error";
			res.text = " ";
			printf(">>>>>未能检测到有效声音,请重试\n");
		}
		whole_result = "";
		/*[1-3]语音识别结束]*/
		delete_asr_engine();
		write_first_data = 0;
		sleep(1.0);
		
	}
	printf(" \n");
	printf(" \n");
	//ROS_INFO("close the offline recognise mode ...\n");
	return true;
}


/*程序入口*/
int main(int argc, char *argv[])
{
	ros::init(argc, argv, "voice_control");
	ros::NodeHandle ndHandle("~");
	ndHandle.param("/confidence", confidence, 0);//离线命令词识别置信度阈值
	ndHandle.param("/seconds_per_order", time_per_order, 3); //单次录制音频的时长
	ndHandle.param("source_path", source_path, std::string("/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/tarkbot_voice/xf_mic_asr_offline"));
	ndHandle.param("/appid", appid, std::string("37864a4a"));//appid，需要更换为自己的

	printf("-----confidence =%d\n",confidence);
	printf("-----time_per_order =%d\n",time_per_order);

	cout<<"-----source_path="<<source_path<<endl;
	cout<<"-----appid="<<appid<<endl;

	APPID = &appid[0];

	ros::NodeHandle n;

	voice_words_pub = n.advertise<std_msgs::String>(voice_words, 1);

	awake_flag_pub = n.advertise<std_msgs::Int8>(awake_flag, 1);

	voice_flag_pub = n.advertise<std_msgs::Int8>(voice_flag, 1);

	/*srv　接收请求，返回离线命令词识别结果*/
	ros::ServiceServer service_get_wav_list = ndHandle.advertiseService("get_offline_recognise_result_srv", Get_Offline_Recognise_Result);

	std::string begin = "fo|";
	//std::string quit_begin = source_path;
	char *jet_path = join((begin + source_path), ASR_RES_PATH);
	char *grammer_path = join(source_path, GRM_BUILD_PATH);
	char *bnf_path = join(source_path, GRM_FILE);
	//IN_PCM = join(source_path, IN_PCM);
	//[1-1] 通用登录及语法构建

	Recognise_Result inital = initial_asr_paramers(jet_path, grammer_path, bnf_path, LEX_NAME);

	init_rec = 0;
	init_success = 0;
	write_first_data = 0;
	
	ros::AsyncSpinner spinner(3);
	spinner.start();

	while(ros::ok())
	{
	    if (!init_success && init_rec)
	    {
	        //获取当前时间
	        clock_t start, finish;
	        double total_time;
	        start = clock();
	        while (!init_success && whether_finised != 1)
	        {   
	            finish = clock();
	            total_time = (double)(finish - start) / CLOCKS_PER_SEC/2;

	            if (total_time > time_per_order)
	            {
	                printf(">>>>>超出离线命令词最长识别时间\n");
	                record_finish = 1; 
	                break;
	            }
	        } 
	    }		
		
	} 
	ros::spinOnce(); 
	//ros::waitForShutdown();
	return 0;
}
