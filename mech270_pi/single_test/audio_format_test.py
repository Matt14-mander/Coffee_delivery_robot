from pydub import AudioSegment

audio = AudioSegment.from_wav('agent/temp/speech_record.wav')
print(audio.frame_rate, audio.channels)  # 输出采样率和通道数
