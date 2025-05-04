print('导入机械臂连接模块')
import cv2
import numpy as np
import time
from utils_gripper import *
from pymycobot import MechArm270

mc = MechArm270('/dev/ttyAMA0', 1000000)
# 设置运动模式为插补
mc.set_fresh_mode(0)

def back_zero():
    print('机械臂归零')
    mc.send_angles([0, 0, 0, 0, 0, 0], 40)
    time.sleep(3)

def relax_arms():
    print('放松机械臂关节')
    mc.release_all_servos()

def head_shake():
    # 左右摆头
    mc.send_angles([0, 0, 0, 0, 0, 0], 80)
    mc.send_angles([0.87,(-50.44),47.28,90.35,(-0.43),(-0.26)],70)
    time.sleep(1)
    for count in range(2):
        mc.send_angle(5, 30, 80)
        time.sleep(0.5)
        mc.send_angle(5, -30,80)
        time.sleep(0.5)
    mc.send_angles([0, 0, 0, 0, 0, 0], 80)
    time.sleep(2)

def head_dance():
    # 跳舞
    mc.send_angles([0.87,(-50.44),47.28,0.35,(-0.43),(-0.26)],70)
    time.sleep(1)
    for count in range(1):
        mc.send_angles([(-0.17),(-54.3),58.91,(-39.9),59.32,(-0.52)],80)
        time.sleep(1.2)
        mc.send_angles([67.85,(-47.42),(-116.98),106.52,23.11,(-0.52)],80)
        time.sleep(1.7)
        mc.send_angles([(-38.14),(-65.04),46.63,69.69,3.25,(-11.6)],80)
        time.sleep(1.7)
        mc.send_angles([2.72,(-24.19),-140.27,(-110.74),(-6.15),(-11.25)],80)
        time.sleep(1)
        mc.send_angles([0,0,0,0,0,0],80)

def head_nod():
    # 点头
    mc.send_angles([0.87,(-50.44),47.28,0.35,(-0.43),(-0.26)],70)
    time.sleep(1)
    for count in range(2):
        mc.send_angle(5, 30, 80)
        time.sleep(0.5)
        mc.send_angle(5, -30,80)
        time.sleep(0.5)
    mc.send_angles([0.87,(-50.44),47.28,0.35,(-0.43),(-0.26)],70)
    time.sleep(1)
    mc.send_angles([0, 0, 0, 0, 0, 0], 40)

def move_to_coords(X=150, Y=-130, HEIGHT_SAFE=230):
    print('移动至指定坐标：X {} Y {}'.format(X, Y))
    mc.send_coords([X, Y, HEIGHT_SAFE, 0, 180, 90], 20, 0)
    time.sleep(4)

def single_joint_move(joint_index, angle):
    print('关节 {} 旋转至 {} 度'.format(joint_index, angle))
    mc.send_angle(joint_index, angle, 40)
    time.sleep(2)

def move_to_top_view():
    print('移动至俯视姿态')
    mc.send_angles([0.52, 30.14, -49.57, -4.13, 90.08, 10.72], 10)
    time.sleep(3)

def move_to_stand_view():
    print('移动至站立姿态')
    mc.send_angles([0, -74, 27, 2.5, 42, -8], 80)
    time.sleep(4)

def top_view_shot(check=False):
    '''
    拍摄一张图片并保存
    check：是否需要人工看屏幕确认拍照成功，再在键盘上按q键确认继续
    '''
    print('    移动至俯视姿态')
    move_to_top_view()
    
    # 获取摄像头，传入0表示获取系统默认摄像头
    cap = cv2.VideoCapture(0)
    # 打开cap
    cap.open(0)
    time.sleep(0.3)
    success, img_bgr = cap.read()
    
    # 保存图像
    print('    保存至temp/vl_now.jpg')
    cv2.imwrite('temp/vl_now.jpg', img_bgr)

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
    # cv2.destroyAllWindows()

def stand_view_shot(check=False):
    '''
    拍摄一张图片并保存
    check：是否需要人工看屏幕确认拍照成功，再在键盘上按q键确认继续
    '''
    print('    移动至俯视姿态')
    move_to_stand_view()
    
    # 获取摄像头，传入0表示获取系统默认摄像头
    cap = cv2.VideoCapture(0)
    # 打开cap
    cap.open(0)
    time.sleep(0.3)
    success, img_bgr = cap.read()
    
    # 保存图像
    print('    保存至temp/vl_now.jpg')
    cv2.imwrite('temp/vl_now.jpg', img_bgr)

    # 屏幕上展示图像
    # cv2.destroyAllWindows()   # 关闭所有opencv窗口
    # cv2.imshow('zihao_vlm', img_bgr) 
    
    # if check:
    #     print('请确认拍照成功，按c键继续，按q键退出')
    #     while(True):
    #         key = cv2.waitKey(10) & 0xFF
    #         if key == ord('c'): # 按c键继续
    #             break
    #         if key == ord('q'): # 按q键退出
    #             # exit()
    #             cv2.destroyAllWindows()   # 关闭所有opencv窗口
    #             raise NameError('按q退出')
    # else:
    #     if cv2.waitKey(10) & 0xFF == None:
    #         pass
        
    # 关闭摄像头
    cap.release()
    # 关闭图像窗口
    # cv2.destroyAllWindows()

def eye2hand(X_im=160, Y_im=120):
    '''
    输入目标点在图像中的像素坐标，转换为机械臂坐标
    '''

    # 整理两个标定点的坐标
    cali_1_im = [62, 394]                       # 左下角，第一个标定点的像素坐标，要手动填！
    cali_1_mc = [29.4, 147.1]                  # 左下角，第一个标定点的机械臂坐标，要手动填！
    cali_2_im = [565, 48]                         # 右上角，第二个标定点的像素坐标
    cali_2_mc = [0.0, 249.2]                    # 右上角，第二个标定点的机械臂坐标，要手动填！
    
    X_cali_im = [cali_1_im[0], cali_2_im[0]]     # 像素坐标
    X_cali_mc = [cali_1_mc[0], cali_2_mc[0]]     # 机械臂坐标
    Y_cali_im = [cali_2_im[1], cali_1_im[1]]     # 像素坐标，先小后大
    Y_cali_mc = [cali_2_mc[1], cali_1_mc[1]]     # 机械臂坐标，先大后小

    # X差值
    X_mc = int(np.interp(X_im, X_cali_im, X_cali_mc))

    # Y差值
    Y_mc = int(np.interp(Y_im, Y_cali_im, Y_cali_mc))

    return X_mc, Y_mc

def eye2hand_gripper(Y_im=160, Z_im=120):
    '''
    输入目标点在图像中的像素坐标，转换为机械臂坐标
    '''

    # 整理两个标定点的坐标
    cali_1_im = [689, 720]                       # 左下角，第一个标定点的像素坐标，要手动填！
    cali_1_mc = [0, 320]                  # 左下角，第一个标定点的机械臂坐标，要手动填！
    cali_2_im = [586, 275]                         # 右上角，第二个标定点的像素坐标
    cali_2_mc = [100.0, 260.3]                    # 右上角，第二个标定点的机械臂坐标，要手动填！
    
    Y_cali_im = [cali_1_im[0], cali_2_im[0]]     # 像素坐标
    Y_cali_mc = [cali_1_mc[0], cali_2_mc[0]]     # 机械臂坐标
    Z_cali_im = [cali_2_im[1], cali_1_im[1]]     # 像素坐标，先小后大
    Z_cali_mc = [cali_2_mc[1], cali_1_mc[1]]     # 机械臂坐标，先大后小

    # y差值
    Y_mc = int(np.interp(Y_im, Y_cali_im, Y_cali_mc))

    # Y差值
    Z_mc = int(np.interp(Z_im, Z_cali_im, Z_cali_mc))

    return Y_mc, Z_mc

def gripper_on(mc, DISTANCE_X=180.2, DISTANCE_SAFE=120, YZ_OBJECT=[230,-50]):
        # 设置运动模式为插补
    mc.set_fresh_mode(0)
    
    # # 机械臂归零
    # print('    机械臂归零')
    # mc.send_angles([0.43, -12.74, -8.78, -5.18, 9.22, 0.26], 80)
    # time.sleep(4)
    
    # 机械爪移动至物体上方
    print('    机械爪移动至物体前方')
    mc.send_coords([DISTANCE_SAFE, YZ_OBJECT[0], YZ_OBJECT[1]+20, -20, 76, -20], 20, 0)
    time.sleep(2)

    # 开启机械爪
    gripper_open()
    time.sleep(2)
    # 机械爪向前抓取物体
    print('    机械爪向前抓取物体')
    mc.send_coords([DISTANCE_X, YZ_OBJECT[0], YZ_OBJECT[1], -20, 76, -20], 15, 0)
    time.sleep(2)
    gripper_off()
    time.sleep(2)

    # 抓起物体
    print('    抓起物体')
    mc.send_coords([DISTANCE_SAFE, YZ_OBJECT[0], YZ_OBJECT[1]+20, -20, 76, -20], 15, 0)
    time.sleep(2)

    # TODO 送到车上/一直抓着
    # mc.send_angles([0.43, -12.74, -8.78, -5.18, 9.22, 0.26], 40)
    # time.sleep(2)
    mc.send_angles([90.26, 43.85, -14.15, -1.58, -44.12, -3.33], 40)
    time.sleep(2)
    gripper_open()
    time.sleep(2)
    # # 搬运物体至目标上方
    # print('    搬运物体至目标上方')
    # mc.send_coords([DISTANCE_SAFE, YZ_END[0], YZ_END[1], 31.29, 76.92, 47.17], 15, 0)
    # time.sleep(4)

    # # 向下放下物体
    # print('    向下放下物体')
    # mc.send_coords([DISTANCE_END, YZ_END[0], YZ_END[1], 31.29, 76.92, 47.17], 20, 0)
    # time.sleep(3)

    # 机械臂归零
    # print('    机械臂归零')
    # mc.send_angles([0, 0, 0, 0, 0, 0], 40)
    # time.sleep(3)