from utils_vlm_move import vlm_vqa 
import time

def test_vlm_vqa():
    """
    测试多模态大模型用于医疗问诊的函数。
    """
    
    # 设置测试问诊提示词
    test_prompt = "我摔伤了, 请你看看桌面上有哪些物体, 其中有什么能帮助到我"

    # 调用视觉问诊函数
    # result = vlm_vqa(PROMPT=test_prompt)

    print('开始测试：vlm_vqa')
    try:
        vlm_vqa(PROMPT=test_prompt, input_way='keyboard')
        print('✅ 测试完成')
    except Exception as e:
        print('❌ 测试失败：', e)


if __name__ == '__main__':
    test_vlm_vqa()
