from utils_robot import *
from utils_asr import *
from utils_vlm import *
from utils_robot import gripper_on

import time

def vlm_move(PROMPT='帮我把绿色方块放在小猪佩奇上', input_way='keyboard'):
    '''
    多模态大模型识别图像，机械爪抓取并移动物体
    input_way：speech语音输入，keyboard键盘输入
    '''

    print('多模态大模型识别图像，吸泵吸取并移动物体')
    
    # 机械臂归零
    # print('机械臂归零')
    # mc.send_angles([0, 0, 0, 0, 0, 0], 50)
    # time.sleep(3)
    
    ## 第一步：完成手眼标定
    print('第一步：完成手眼标定')
    
    ## 第二步：发出指令
    # PROMPT_BACKUP = '帮我把绿色方块放在小猪佩奇上' # 默认指令
    
    # if input_way == 'keyboard':
    #     PROMPT = input('第二步：输入指令')
    #     if PROMPT == '':
    #         PROMPT = PROMPT_BACKUP
    # elif input_way == 'speech':
    #     record() # 录音
    #     PROMPT = speech_recognition() # 语音识别
    print('第二步，给出的指令是：', PROMPT)
    
    ## 第三步：拍摄正视图
    print('第三步：拍摄正视图')
    stand_view_shot(check=False)
    
    ## 第四步：将图片输入给多模态视觉大模型
    print('第四步：将图片输入给多模态视觉大模型')
    img_path = 'temp/vl_now.jpg'
    
    n = 1
    while n < 5:
        try:
            print('    尝试第 {} 次访问多模态大模型'.format(n))
            # result = yi_vision_api(PROMPT, img_path='temp/vl_now.jpg')  # yi_vision定位能力出现波动，暂时换用QwenVL系列
            result = QwenVL_api(PROMPT, img_path='temp/vl_now.jpg', vlm_option=0)
            print('    多模态大模型调用成功！')
            print(result)
            break
        except Exception as e:
            print('    多模态大模型返回数据结构错误，再尝试一次', e)
            n += 1
    
    ## 第五步：视觉大模型输出结果后处理和可视化
    print('第五步：视觉大模型输出结果后处理和可视化')
    OBJECT_Y_CENTER, OBJECT_Z_CENTER = post_processing_viz_2(result, img_path, check=False)
    # START_Y_CENTER, START_Z_CENTER, END_Y_CENTER, END_Z_CENTER = post_processing_viz(result, img_path, check=False)
    
    ## 第六步：手眼标定转换为机械臂坐标
    print('第六步：手眼标定，将像素坐标转换为机械臂坐标')
    # 起点，机械臂坐标
    OBJECT_Y_MC, OBJECT_Z_MC = eye2hand(OBJECT_Y_CENTER, OBJECT_Z_CENTER)
    # 终点，机械臂坐标
    # END_Y_MC, END_Z_MC = eye2hand(END_Y_CENTER, END_Z_CENTER)
    
    ## 第七步：机械爪移动物体
    print('第七步：机械爪抓取移动物体')
    gripper_on(mc=mc, YZ_OBJECT=[OBJECT_Y_MC, OBJECT_Z_MC])
    
    ## 第八步：收尾
    print('第八步：任务完成')
    cv2.destroyAllWindows()   # 关闭所有opencv窗口
    # exit()
   
def vlm_vqa(PROMPT='请数一数图中中几个方块', input_way='keyboard'):
    # 机械臂归零
    # print('机械臂归零')
    # mc.send_angles([0, 0, 0, 0, 0, 0], 50)
    # time.sleep(3)
    print('第二步，给出的指令是：', PROMPT)
    stand_view_shot(check=False)
    img_path = 'temp/vl_now.jpg'
    result = QwenVL_api(PROMPT, img_path='temp/vl_now.jpg', vlm_option=1)
    print('    多模态大模型调用成功！')
    # print(result)
    cv2.destroyAllWindows()   # 关闭所有opencv窗口
    return result

    
    
    
