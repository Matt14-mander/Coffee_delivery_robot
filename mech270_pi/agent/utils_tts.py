import os
import appbuilder
from API_KEY import *
import pyaudio
import wave

APPBUILDER_TOKEN = "bce-v3/ALTAK-zUMTlWBag85ITrDZrN1PS/20fbaf17474f400810a8bc09ec3ea0a746431588"
os.environ["APPBUILDER_TOKEN"] = APPBUILDER_TOKEN
tts_ab = appbuilder.TTS()
 
 
def tts(TEXT='我是马特的机械臂', tts_wav_path = 'temp/tts.wav'):
    '''语音合成TTS，生成wav音频文件'''
    inp = appbuilder.Message(content={"text": TEXT})
    out = tts_ab.run(inp, model="paddlespeech-tts", audio_type="wav")
    with open(tts_wav_path, "wb") as f:
        f.write(out.content["audio_binary"])
    print("TTS语音合成，导出wav音频文件至：{}".format(tts_wav_path))

def convert_to_stereo(wav_file, output_dir='temp'):
    '''
    将单声道wav音频转换为双声道，并保留转换后的音频文件
    '''
    stereo_wav_file = os.path.join(output_dir, 'stereo_' + os.path.basename(wav_file))
    convert_cmd = f"ffmpeg -y -i {wav_file} -ac 2 {stereo_wav_file}"
    os.system(convert_cmd)
    return stereo_wav_file

def play_wav(wav_file, device='plughw:4,0'):
    '''
    播放wav音频文件，自动适配声卡采样率
    '''
    play_cmd = f'aplay -D {device} -t wav {wav_file} -q'
    os.system(play_cmd)

# def play_wav(wav_file='temp/tts.wav'):
#     '''
#     播放wav文件
#     '''
#     wf = wave.open(wav_file, 'rb')
 
#     # 实例化PyAudio
#     p = pyaudio.PyAudio()
 
#     # 打开流
#     stream = p.open(format=p.get_format_from_width(wf.getsampwidth()),
#                     channels=wf.getnchannels(),
#                     rate=wf.getframerate(),
#                     output=True)

#     chunk_size = 1024
#     # 读取数据
#     data = wf.readframes(chunk_size)
 
#     # 播放音频
#     while data != b'':
#         stream.write(data)
#         data = wf.readframes(chunk_size)
 
#     # 停止流，关闭流和PyAudio
#     stream.stop_stream()
#     stream.close()
#     p.terminate()
