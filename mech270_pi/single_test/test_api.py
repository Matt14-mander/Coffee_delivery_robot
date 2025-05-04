def test_llm_apis():
    '''
    测试千帆和零一大模型API是否正常返回结果
    '''
    from API_KEY import QIANFAN_ACCESS_KEY, QIANFAN_SECRET_KEY, YI_KEY
    
    print("测试千帆API:")
    try:
        response_qianfan = llm_qianfan("千帆，你好，请介绍一下你自己。")
        print("千帆返回结果：", response_qianfan[:100] + '...' if len(response_qianfan) > 100 else response_qianfan)
    except Exception as e:
        print("千帆API调用失败：", e)

    print("\n测试零一API:")
    try:
        messages = [{"role": "user", "content": "你好，请介绍一下你自己。"}]
        response_yi = llm_yi(messages)
        print("零一返回结果：", response_yi[:100] + '...' if len(response_yi) > 100 else response_yi)
    except Exception as e:
        print("零一API调用失败：", e)

# 调用测试函数
if __name__ == "__main__":
    test_llm_apis()
