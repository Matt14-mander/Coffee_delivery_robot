# test_record.py
from utils_asr import record, record_auto, speech_recognition

if __name__ == '__main__':
    print("测试开始：")

    # 设置麦克风索引号（通过 arecord -l 查看，HyperX Cloud III 是 card 2 所以 MIC_INDEX=2）
    MIC_INDEX = 2

    # 手动测试固定时长录音
    print("调用 record() 函数录制 5 秒音频：")
    record(MIC_INDEX=MIC_INDEX, DURATION=5)

    # 执行语音识别测试
    print("执行语音识别...")
    try:
        result = speech_recognition()
        print("识别内容为：", result)
    except Exception as e:
        print("语音识别出错：", e)

    # 若你还想测试自动开始/停止录音：
    # print("调用 record_auto() 测试自动录音")
    # record_auto(MIC_INDEX=MIC_INDEX)

    print("测试完成")

