from utils_vlm_move import vlm_move  # 假设你的主函数保存在 vlm_robot.py 中
import time

def test_vlm_move():
    """
    测试 vlm_move 函数是否能准确抓取物体。
    测试过程中需确保摄像头、吸泵、电控系统和多模态模型正常运行。
    """

    # 测试指令：放置绿色方块到小猪佩奇上
    test_prompt = '帮我拿一下红色圆柱'
    
    print('开始测试：vlm_move')
    try:
        vlm_move(PROMPT=test_prompt, input_way='keyboard')  # 此处可选 'speech'
        print('✅ 测试完成：请检查机械臂是否成功完成抓取与放置任务。')
    except Exception as e:
        print('❌ 测试失败：', e)

if __name__ == '__main__':
    test_vlm_move()
