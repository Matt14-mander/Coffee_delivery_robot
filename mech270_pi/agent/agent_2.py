# 导入常用函数
from utils_asr import *             # 录音+语音识别
from utils_robot import *           # 连接机械臂
from utils_llm import *             # 大语言模型API
from utils_camera import *          # 摄像头
from utils_vlm_move import *        # 多模态大模型识别图像，吸泵吸取并移动物体
from utils_drag_teaching import *   # 拖动示教
from utils_agent import *           # 智能体Agent编排
from utils_tts import *             # 语音合成模块
from utils_gripper import *         # 机械爪

# 播放欢迎语
gripper_off()
play_wav('asset/welcome.wav')

message = [{"role": "system", "content": AGENT_SYS_PROMPT}]

def agent_play():
    '''
    主函数，默认语音控制智能体，执行动作并语音反馈
    '''
    back_zero()

    print("开始默认录音...")
    DURATION = 5  # 默认录音时长（秒）
    record(DURATION=DURATION)         # 录音
    order = speech_recognition()      # 语音识别
    print("识别到的指令：", order)

    # 智能体Agent编排动作
    message.append({"role": "user", "content": order})
    agent_plan_output = eval(agent_plan(message))
    
    print('智能体编排动作如下：\n', agent_plan_output)
    
    response = agent_plan_output['response']
    print('开始语音合成：', response)
    tts(response)
    play_wav('temp/tts.wav')

    output_other = ''
    for each in agent_plan_output['function']:
        print('开始执行动作：', each)
        ret = eval(each)
        if ret is not None:
            output_other = ret

    agent_plan_output['response'] += '.' + output_other
    message.append({"role": "assistant", "content": str(agent_plan_output)})

if __name__ == '__main__':
    while True:
        agent_play()
