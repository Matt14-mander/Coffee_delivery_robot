print('导入机械臂连接模块')

from pymycobot import MechArm270
from pymycobot import PI_PORT, PI_BAUD
import cv2
import numpy as np
import time

# 连接机械臂
mc = MechArm270(PI_PORT, PI_BAUD)
# 设置运动模式为插补
mc.set_fresh_mode(0)

# 左右摆头
# mc.send_angles([0, 0, 0, 0, 0, 0], 80)
# mc.send_angles([0.87,(-50.44),47.28,90.35,(-0.43),(-0.26)],70)
# time.sleep(1)
# for count in range(2):
#     mc.send_angle(5, 30, 80)
#     time.sleep(0.5)
#     mc.send_angle(5, -30,80)
#     time.sleep(0.5)
# mc.send_angles([0, 0, 0, 0, 0, 0], 80)
# time.sleep(2)

# 点头
# mc.send_angles([0.87,(-50.44),47.28,0.35,(-0.43),(-0.26)],70)
# time.sleep(1)
# for count in range(2):
#    mc.send_angle(5, 30, 80)
#    time.sleep(0.5)
#    mc.send_angle(5, -30,80)
#    time.sleep(0.5)
# mc.send_angles([0.87,(-50.44),47.28,0.35,(-0.43),(-0.26)],70)
# time.sleep(1)
# mc.send_angles([0, 0, 0, 0, 0, 0], 40)
# time.sleep(2)

# 跳舞
# mc.send_angles([0.87,(-50.44),47.28,0.35,(-0.43),(-0.26)],70)
# time.sleep(1)
# for count in range(1):
#    mc.send_angles([(-0.17),(-54.3),58.91,(-39.9),59.32,(-0.52)],80)
#    time.sleep(1.2)
#    mc.send_angles([67.85,(-47.42),(-116.98),106.52,23.11,(-0.52)],80)
#    time.sleep(1.7)
#    mc.send_angles([(-38.14),(-65.04),46.63,69.69,3.25,(-11.6)],80)
#    time.sleep(1.7)
#    mc.send_angles([2.72,(-24.19),-140.27,(-110.74),(-6.15),(-11.25)],80)
#    time.sleep(1)
#    mc.send_angles([0,0,0,0,0,0],80)

init_angles = [
    [-60, 0, 0, -90, 0, -90],  # first init point
    # [0, 49, 0, -104, 0, -45, -0.79],  # second init point
    [0, -49, 0, -100, 0, -45],
     # [-0.26, 2.0, 0.43, -111.0, 0.43, 20.22, -0.79],  # third
    [-3.16, -11.77, 0.17, -100, -0.52, -3.25],  # third
    [3.25, -8.61, 0.17, -99.14, 1.14, -2.81],  # left
    [-10.01, -6.85, 0.17, -99.49, -2.63, -2.81],  # right
]

# win
# for i in range(5):
#    mc.send_angles([0.0, -0.34, 0.17, -100.62, 0.17, 20.29], 90)
#    time.sleep(1)
#    mc.send_angles([0.0, -0.34, 0.17, -100.62, 0.17, 20.29], 90)
#    time.sleep(1)
# print(init_angles[2])

# mc.send_angles(init_angles[2], 50)
# time.sleep(3)

# fail
# mc.send_angles([0.0, -18.34, 0.17, -100.62, 0.17, -7.29, 0.08], 50)
# time.sleep(3)
# mc.send_angles([0.0, -18.34, 0.17, -100.62, 0.17, -26.29, 0.08], 5)
# time.sleep(7)
# mc.send_angle(4, -80, 30)
# time.sleep(3)

# coord
# X = 150
# Y = -130
# HEIGHT_SAFE=230
# print('移动至指定坐标：X {} Y {}'.format(X, Y))
# mc.send_coords([X, Y, HEIGHT_SAFE, 0, 180, 90], 20, 0)
# time.sleep(4)
# mc.send_coords([150, -130, 230, 0, 180, 90], 50, 0)

# import RPi.GPIO as GPIO
# 初始化GPIO
# GPIO.setwarnings(False)   # 不打印 warning 信息
# GPIO.setmode(GPIO.BCM)
# GPIO.setup(20, GPIO.OUT)
# GPIO.setup(21, GPIO.OUT)
# GPIO.output(20, 1)        # 关闭吸泵电磁阀

check = False
# print('    移动至俯视姿态')
# mc.send_angles([0.52, 30.14, -49.57, -4.13, 90.08, 10.72], 10)
mc.send_angles([0, -74, 27, 2.5, 42, -8], 50)
# 获取摄像头，传入0表示获取系统默认摄像头
cap = cv2.VideoCapture(0)
# 打开cap
cap.open(0)
time.sleep(0.3)
success, img_bgr = cap.read()

if not success:
    print("拍摄失败，未能读取摄像头图像。")
    cap.release()
    cv2.destroyAllWindows()
    raise RuntimeError('摄像头图像获取失败')

# 保存图像
print('    保存至temp/vl_now.jpg')
cv2.imwrite('image/test_vl_now.jpg', img_bgr)

# 屏幕上展示图像
cv2.destroyAllWindows()   # 关闭所有opencv窗口
cv2.imshow('zihao_vlm', img_bgr) 

if check:
    print('请确认拍照成功，按c键继续，按q键退出')
    while(True):
        key = cv2.waitKey(10) & 0xFF
        if key == ord('c'): # 按c键继续
           break
        if key == ord('q'): # 按q键退出
            # exit()
            cv2.destroyAllWindows()   # 关闭所有opencv窗口
            raise NameError('按q退出')
else:
    if cv2.waitKey(10) & 0xFF == None:
        pass
        
# 关闭摄像头
cap.release()
# 关闭图像窗口
cv2.destroyAllWindows()
print("图像窗口已关闭，摄像头已释放。")
