print('导入自适应爪控制模块')
from pymycobot.mecharm270 import MechArm270
import time

mc = MechArm270("/dev/ttyAMA0", 1000000)

def gripper_open():
    print('打开机械爪')
    mc.set_gripper_value(100, 70)

def gripper_off():
    print('关闭机械爪')
    mc.set_gripper_value(0, 70)




# if __name__ == "__main__":
#     mc = MechArm270("/dev/ttyAMA0", 1000000)
#     # 让其移动到零位
#     mc.set_encoders([2048, 2048, 2048, 2048, 2048, 2048], 20)
#     time.sleep(3)
#     gripper_open(mc)
#     time.sleep(2)
#     gripper_off(mc)