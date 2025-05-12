#include <ros/ros.h>
#include <time.h>
#include "wav_head.h"

using namespace std;

std::string source_path = "";
std::string appid = "";
std::string voice_name = "";
std::string tts_text = "";
int rdn;
int volume;
int pitch;
int speed;
int sample_rate;
const char* params_l;
const char* params_s;
const char* params_f;
const char* params_t;

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

/* 字符串与字符数组拼接 */
char *join(std::string b, char *s2)
{
	char s1[600] = "";
	try
	{
		strcpy(s1, b.c_str());
	}
	catch (...)
	{
		cout << ">>>>>join拷贝失败" << endl;
	}
	char *result = (char *)malloc(strlen(s1) + strlen(s2) + 1);
	if (result == NULL)
		exit(1);

	try
	{
		strcpy(result, s1);
		strcat(result, s2);
	}
	catch (...)
	{
		cout << ">>>>>join拷贝失败" << endl;
	}
	return result;
}



/* 获取时间 */
std::string current_time()
{
	std::string fmt = ".wav";
    static char t_buf[64];
	time_t now_time = time(NULL);
    struct tm* time = localtime(&now_time);
    strftime(t_buf, 64, "%Y-%m-%d %H:%M:%S", time);
    std::wstring wtxt = s2ws(t_buf);
	std::string txt_uft8 = ws2s(wtxt);
    txt_uft8 += fmt;
    return txt_uft8;
}

/* 文本合成 */
int text_to_speech(const char* src_text, const char* des_path, const char* params)
{
	int          ret          = -1;
	FILE*        fp           = NULL;
	const char*  sessionID    = NULL;
	unsigned int audio_len    = 0;
	wave_pcm_hdr wav_hdr      = default_wav_hdr;
	int          synth_status = MSP_TTS_FLAG_STILL_HAVE_DATA;

	if (NULL == src_text || NULL == des_path)
	{
		printf("params is error!\n");
		return ret;
	}
	fp = fopen(des_path, "wb");
	if (NULL == fp)
	{
		printf("open %s error.\n", des_path);
		return ret;
	}
	/* 开始合成 */
	sessionID = QTTSSessionBegin(params, &ret);
	if (MSP_SUCCESS != ret)
	{
		printf("QTTSSessionBegin failed, error code: %d.\n", ret);
		fclose(fp);
		return ret;
	}
	ret = QTTSTextPut(sessionID, src_text, (unsigned int)strlen(src_text), NULL);
	if (MSP_SUCCESS != ret)
	{
		printf("QTTSTextPut failed, error code: %d.\n",ret);
		QTTSSessionEnd(sessionID, "TextPutError");
		fclose(fp);
		return ret;
	}
	printf("正在合成 ...\n");
	fwrite(&wav_hdr, sizeof(wav_hdr) ,1, fp); //添加wav音频头，使用采样率为16000
	while (1) 
	{
		/* 获取合成音频 */
		const void* data = QTTSAudioGet(sessionID, &audio_len, &synth_status, &ret);
		if (MSP_SUCCESS != ret)
			break;
		if (NULL != data)
		{
			fwrite(data, audio_len, 1, fp);
		    wav_hdr.data_size += audio_len; //计算data_size大小
		}
		if (MSP_TTS_FLAG_DATA_END == synth_status)
			break;
	}
	printf("\n");
	if (MSP_SUCCESS != ret)
	{
		printf("QTTSAudioGet failed, error code: %d.\n",ret);
		QTTSSessionEnd(sessionID, "AudioGetError");
		fclose(fp);
		return ret;
	}
	/* 修正wav文件头数据的大小 */
	wav_hdr.size_8 += wav_hdr.data_size + (sizeof(wav_hdr) - 8);
	
	/* 将修正过的数据写回文件头部,音频文件为wav格式 */
	fseek(fp, 4, 0);
	fwrite(&wav_hdr.size_8,sizeof(wav_hdr.size_8), 1, fp); //写入size_8的值
	fseek(fp, 40, 0); //将文件指针偏移到存储data_size值的位置
	fwrite(&wav_hdr.data_size,sizeof(wav_hdr.data_size), 1, fp); //写入data_size的值
	fclose(fp);
	fp = NULL;
	/* 合成完毕 */
	ret = QTTSSessionEnd(sessionID, "Normal");
	if (MSP_SUCCESS != ret)
	{
		printf("QTTSSessionEnd failed, error code: %d.\n",ret);
	}

	return ret;
}

int tts_init()
{
	int         ret                  = MSP_SUCCESS;
	std::string login_ori		 	 = "appid = ";
	std::string login_fin     	 	 = login_ori + appid + ", work_dir = .";
	const char* login_params = login_fin.c_str();//登录参数,appid与msc库绑定,请勿随意改动
	//cout<< ">>>>>>> login_params:"<< login_params<< endl;

	std::string session_ori_1		 = "engine_type = local,voice_name=";
	std::string session_ori_2		 = ", text_encoding = UTF8, tts_res_path = fo|";
	std::string session_ori_3		 = "/config/bin/msc/res/tts/xiaoyan.jet;fo|";
	std::string session_ori_4		 = "/config/bin/msc/res/tts/common.jet, sample_rate = ";
	std::string session_ori_5	 	 = ", volume = ";
	std::string session_ori_6	 	 = ", pitch = ";
	std::string session_ori_7	 	 = ", rdn = ";
	std::string session_ori_8	 	 = ", speed = ";
	std::string session_fin			 = session_ori_1 + voice_name + session_ori_2 + source_path + session_ori_3 + source_path + session_ori_4 + std::to_string(sample_rate) + session_ori_5 + std::to_string(volume) + session_ori_6 + std::to_string(pitch) + session_ori_7 + std::to_string(rdn) + session_ori_8 + std::to_string(speed);
	const char* session_begin_params = session_fin.c_str();
	//cout<< ">>>>>>> session_begin_params:"<< session_begin_params<< endl;

	std::string filename_fin		 = source_path + "/audio/" + current_time();
	const char* filename             = filename_fin.c_str(); //合成的语音文件名称
	//cout<< ">>>>>>> filename:"<< filename << endl;
	const char* text                 = tts_text.c_str(); //合成文本
	/* 用户登录 */
	ret = MSPLogin(NULL, NULL, login_params); //第一个参数是用户名，第二个参数是密码，第三个参数是登录参数，用户名和密码可在http://www.xfyun.cn注册获取
	if (MSP_SUCCESS != ret)
	{
		printf("MSPLogin failed, error code: %d.\n", ret);
		goto exit ;//登录失败，退出登录
	}

	printf("\n###########################################################################\n");
	printf("## 语音合成（Text To Speech，TTS）技术能够自动将任意文字实时转换为连续的 ##\n");
	printf("## 自然语音，是一种能够在任何时间、任何地点，向任何人提供语音信息服务的  ##\n");
	printf("## 高效便捷手段，非常符合信息时代海量数据、动态更新和个性化查询的需求。  ##\n");
	printf("###########################################################################\n\n");

	/* 文本合成 */
	printf("开始合成 ...\n");
	ret = text_to_speech(text, filename, session_begin_params);
	if (MSP_SUCCESS != ret)
	{
		printf("text_to_speech failed, error code: %d.\n", ret);
	}
	printf("合成完毕\n");

exit:
	MSPLogout(); //退出登录

	return 0;
}

int main(int argc, char** argv)
{

	ros::init(argc, argv, "tts_node");    //初始化ROS节点

	ros::NodeHandle node("~");    //创建句柄

	node.param("source_path", source_path, std::string("/home/passoni/catkin_ws/11111"));
	node.param("/appid", appid, std::string("111111"));
	node.param("/voice_name", voice_name, std::string("111111"));
	node.param("tts_text", tts_text, std::string("111111"));
	node.param("/rdn", rdn, 0);
	node.param("/volume", volume, 0);
	node.param("/pitch", pitch, 0);
	node.param("/speed", speed, 0);
	node.param("/sample_rate", sample_rate, 0);

	cout<< ">>>>>>> "<< source_path << endl;

	tts_init();

/*	while(ros::ok())
	{
		
	} */

	//ros::spinOnce(); 
	ros::spin();     
	
	return 0;
}