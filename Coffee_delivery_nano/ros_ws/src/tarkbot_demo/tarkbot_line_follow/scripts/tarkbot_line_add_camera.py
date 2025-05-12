#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
import numpy 
from dynamic_reconfigure.server import Server
from tarkbot_line_follow.cfg import line_hsvConfig
from geometry_msgs.msg import Twist

def line_color_find():    
    #定义发布的话题等数据
    global color_mode, bridge, image_sub, mask_pub, result_pub, pub_cmd, lowerh, lowers, lowerv, upperh, uppers, upperv
    bridge = CvBridge()
    image_sub = rospy.Subscriber("/usb_cam/image_raw", Image, callback)
    mask_pub = rospy.Publisher("/mask_image", Image, queue_size=1)
    result_pub = rospy.Publisher("/line_image", Image, queue_size=1)
    pub_cmd = rospy.Publisher('cmd_vel', Twist, queue_size=5)
    srv = Server(line_hsvConfig,dynamic_reconfigure_callback)

    lowerh = int(rospy.get_param('~lowerh',110))
    lowers = int(rospy.get_param('~lowers',50))
    lowerv = int(rospy.get_param('~lowerv',50))

    upperh = int(rospy.get_param('~upperh',130))
    uppers = int(rospy.get_param('~uppers',255))
    upperv = int(rospy.get_param('~upperv',255))

# 动态参数服务函数
def dynamic_reconfigure_callback(config,level):
    global lowerh, lowers, lowerv, upperh, uppers, upperv
    lowerh = config.lowerh
    lowers = config.lowers
    lowerv = config.lowerv
    upperh = config.upperh
    uppers = config.uppers
    upperv = config.upperv
    return config

# 收到图像后的回调函数
def callback(data):
    global res, mask, lowerh, lowers, lowerv, upperh, uppers, upperv
    # convert ROS topic to CV image formart
    cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
    # conver image color from RGB to HSV    
    hsv_image = cv2.cvtColor(cv_image,cv2.COLOR_RGB2HSV)
    #set color mask min amd max value
    line_lower = numpy.array([lowerh,lowers,lowerv])
    line_upper = numpy.array([upperh,uppers,upperv])
    # get mask from color
    mask = cv2.inRange(hsv_image,line_lower,line_upper)
    # close operation to fit some little hole
    kernel = numpy.ones((9,9),numpy.uint8)
    mask = cv2.morphologyEx(mask,cv2.MORPH_CLOSE,kernel)
    # if test mode,output the center point HSV value
    res = cv_image
    cv2.circle(res, (int(hsv_image.shape[1]/2),int(hsv_image.shape[0]/2)), 5, (0,0,255), 1)
    rospy.loginfo("Point HSV is %s"%hsv_image[int(hsv_image.shape[0]/2),int(hsv_image.shape[1]/2)])               
    # 图像处理函数
    image_processing()

# 对原始图像进行处理发布
def image_processing():
    img_msg = bridge.cv2_to_imgmsg(res, encoding="bgr8")
    img_msg.header.stamp = rospy.Time.now()
    result_pub.publish(img_msg)
    img_msg = bridge.cv2_to_imgmsg(mask, encoding="passthrough")
    img_msg.header.stamp = rospy.Time.now()
    mask_pub.publish(img_msg)

if __name__ == '__main__':
    try:
        # init ROS node 
        rospy.init_node("line_follow_Find")
        rospy.loginfo("Starting Line Find node")
        line_color_find()
        rospy.spin()
    except KeyboardInterrupt:
        print ("Shutting down cv_bridge_test node.")
        cv2.destroyAllWindows()
