#!/usr/bin/env python
# coding=utf-8

import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
import numpy
from geometry_msgs.msg import Twist
from simple_follower.msg import position as PositionMsg
from std_msgs.msg import Int8

# 色彩矩阵，当前测试出的几种色彩
color_arry = [[100,55,90,130,215,170], # red
              [0,220,160,20,255,220],# blue
              [20,155,45,60,195,85], # green
              [75,195,195,115,235,255], # yellow
              [0,0,0,150,40,46]]    # black
# 记录颜色跟随时的误差值
diff= 0
d_diff= 0
last_diff= 0
angleX = 0
distance = 0
stop = 0
targetDist = 0.2

def line_follow_init():    
    #define topic publisher and subscriber
    global color_mode, bridge, image_sub, mask_pub, result_pub, pub_cmd, beepPublisher, targetDist
    bridge = CvBridge()
    image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, callback)
    mask_pub = rospy.Publisher("/mask_image", Image, queue_size=1)
    result_pub = rospy.Publisher("/line_image", Image, queue_size=1)
    pub_cmd = rospy.Publisher('cmd_vel', Twist, queue_size=5)
    positionSubscriber = rospy.Subscriber('/object_tracker/current_position', PositionMsg, positionUpdateCallback)
    targetDist = rospy.get_param('~targetDist') 
    beepPublisher = rospy.Publisher('/beep', Int8, queue_size =3)

    color_mode = int(rospy.get_param('~color_mode'))
    rospy.loginfo('color_mode:%d', color_mode)


def callback(data):
    global raw_image, mask_image
    # convert ROS topic to CV image formart
    # 将将ROS主题转换为CV图像格式
    raw_image = bridge.imgmsg_to_cv2(data, "bgr8")
    raw_image = cv2.resize(raw_image, (320,240), interpolation=cv2.INTER_AREA)#提高帧率
    # 将图像从 RGB 转为 HSV    
    hsv_image = cv2.cvtColor(raw_image,cv2.COLOR_RGB2HSV)

    # close operation to fit some little hole
    # 创建一个5行5列的数组
    kernel = numpy.ones((5,5),numpy.uint8)
    # 对图片进行膨胀腐蚀操作
    hsvimage_erode = cv2.erode(hsv_image,kernel,iterations=1)
    hsvimag_dilate = cv2.dilate(hsvimage_erode,kernel,iterations=1)
    # 设置图像的HSV阈值
    # h_low s_low v_low
    color_lower = numpy.array([color_arry[color_mode][0],color_arry[color_mode][1],color_arry[color_mode][2]])
    # h_upper s_upper v_upper
    color_upper = numpy.array([color_arry[color_mode][3],color_arry[color_mode][4],color_arry[color_mode][5]])
    # 得到处理后的二值化图像
    mask_image = cv2.inRange(hsvimag_dilate,color_lower,color_upper)
    masked = cv2.bitwise_and(raw_image, raw_image, mask=mask_image)
    # 图像处理函数
    image_processing()

def positionUpdateCallback(position):
    global stop
    if (position.angleX < (-3.14)): 
        #更新角度数据
        angleX = position.angleX + 6.2830
    else:
        # 与目标之间的角度
        angleX = position.angleX 
        # 与目标之间的距离
    distance = position.distance 
    rospy.loginfo('angleX:%f  distance:%f  targetDist:%f', angleX,distance,targetDist)
    if ((abs(angleX)<1.0) & (distance < targetDist)):
        beep = 1
        beepPublisher.publish(beep)
        stop = 1
    else:
        beep = 0
        beepPublisher.publish(beep)
        stop = 0



# 对原始图像进行处理，获得我们需要的图像部分
def image_processing():
    res = raw_image
    h, w, d = res.shape
    search_top = h-20
    search_bot = h
    mask_image[0:search_top, 0:w] = 0
    mask_image[search_bot:h, 0:w] = 0
    # 计算二值化图像的重心，即几何中心
    P = cv2.moments(mask_image)
    # 得到可识别的颜色数据，进行识别和色差计算
    if P['m00'] > 0:
        ix = int(P['m10']/P['m00'])
        iy = int(P['m01']/P['m00'])
        cv2.circle(res, (ix, iy), 10, (255, 0, 255), -1)
        if cv2.circle:
            diff= ix - w/2-15
            d_diff=diff-last_diff
            twist_calculate(diff,d_diff)
    else:
        twist = Twist()
        twist.linear.x = 0
        twist.linear.y = 0
        twist.linear.z = 0
        twist.angular.x = 0
        twist.angular.y = 0
        twist.angular.z = 0
        pub_cmd.publish(twist)

    # 将实际图像和二值化图像通过话题发出
    img_msg = bridge.cv2_to_imgmsg(res, encoding="bgr8")
    img_msg.header.stamp = rospy.Time.now()
    result_pub.publish(img_msg)
    img_msg = bridge.cv2_to_imgmsg(mask_image, encoding="passthrough")
    img_msg.header.stamp = rospy.Time.now()
    mask_pub.publish(img_msg)



# 速度处理函数
def twist_calculate(twist_erro,twist_d_erro):
    twist = Twist()
    twist.linear.x = 0.2
    twist.linear.y = 0
    twist.linear.z = 0
    twist.angular.x = 0
    twist.angular.y = 0
    twist.angular.z = 0
    if twist_erro!=0:
        twist.angular.z = -float(twist_erro)*0.005-float(twist_d_erro)*0.000
    else:
        twist.angular.z = 0
    last_diff=diff
    if(stop == 1):
        twist.linear.x = 0
        twist.angular.z = 0
    pub_cmd.publish(twist)



if __name__ == '__main__':
    try:
        # init ROS node 
        rospy.init_node("line_follow")
        rospy.loginfo("Starting Line Follow node")
        line_follow_init()
        rospy.spin()
    except KeyboardInterrupt:
        print ("Shutting down cv_bridge_test node.")
        cv2.destroyAllWindows()