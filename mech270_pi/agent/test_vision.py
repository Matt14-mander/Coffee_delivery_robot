# main.py
from utils_robot import *
from utils_vlm import yi_vision_api, QwenVL_api, post_processing_viz, post_processing_viz_2

def main():
    stand_view_shot(check=False)
    # 输入的图像路径和任务提示语
    img_path = 'temp/vl_now.jpg'
    prompt = '帮我拿一下红色圆柱体'

    # 选择模型（0 表示 Yi-Vision，1 表示 QwenVL）
    use_qwen = True  # 如果设为 True，则使用通义千问

    # 调用模型
    if use_qwen:
        print('[INFO] 使用 QwenVL 模型进行推理...')
        result = QwenVL_api(prompt, img_path, vlm_option=2)
    else:
        print('[INFO] 使用 Yi-Vision 模型进行推理...')
        result = yi_vision_api(prompt, img_path, vlm_option=0)

    print('[RESULT] 模型输出：', result)

    # 可视化并获取中心坐标
    x, y = post_processing_viz_2(result, img_path, check=True)
    print(f'[INFO] 起点中心坐标：({x}, {y})')

    OBJECT_Y_MC, OBJECT_Z_MC = eye2hand_gripper(x, y)
    print(OBJECT_Y_MC, OBJECT_Z_MC)
    gripper_on(mc=mc, YZ_OBJECT=[-OBJECT_Y_MC, OBJECT_Z_MC])


if __name__ == '__main__':
    # stand_view_shot(check=False)
    main()
