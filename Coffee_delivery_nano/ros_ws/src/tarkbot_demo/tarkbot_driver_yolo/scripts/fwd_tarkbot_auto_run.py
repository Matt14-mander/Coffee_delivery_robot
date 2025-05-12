#!/usr/bin/env python
# coding=utf-8

import rospy
from sensor_msgs.msg import Image
import cv2, cv_bridge
import numpy
from time import sleep
from geometry_msgs.msg import Twist
from std_msgs.msg import Int8
from tarkbot_driver_yolo.msg import ControlWay

last_erro=0

mask_x_left = 1.0000
mask_x_right = 1.0000
mask_y_top = 1.0000
mask_y_bot = 1.0000
center_target = 0.5
vel_x = 0.0000
vel_y_P = 0.0000
vel_y_D = 0.0000
vel_z_P = 0.0000
vel_z_D = 0.0000
state = 0
state_last = 0

def nothing(s):
    pass
hue_black = (0,0,0,180,255,46)# black
hue_red = (0,50,60,14,255,255)# red
hue_blue = (100,43,46,124,255,255)# blue
hue_green= (35,43,46,77,255,255)# green
hue_yellow = (10,70,50,30,255,255)# yellow



class Follower:
    def __init__(self):
        self.bridge = cv_bridge.CvBridge()
        #cv2.namedWindow("window", 1)
        # 订阅usb摄像头
        self.image_sub = rospy.Subscriber("/image_raw", Image, self.image_callback)

        self.driver_mode_sub = rospy.Subscriber("/driver_mode", ControlWay, self.driver_mode_callback)

        self.cmd_vel_pub = rospy.Publisher("/cmd_vel", Twist, queue_size=1)
        self.start_flag_pub = rospy.Publisher("/start_flag", Int8, queue_size=1)
        self.go_outside_pub = rospy.Publisher("/outside_flag", Int8, queue_size=1)
        self.twist = Twist()
        self.flag = Int8()
        self.outside = Int8()
        self.flag.data = 1
        self.outside.data = 0

    def image_callback(self, msg):
        global last_erro
        global mask_x_left
        global mask_x_right
        global mask_y_top
        global mask_y_bot
        global center_target
        global vel_x
        global vel_y_P
        global vel_y_D
        global vel_z_P
        global vel_z_D
        global state
        global state_last
		
        image1 = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        image = cv2.resize(image1, (320,240), interpolation=cv2.INTER_AREA)
        hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

        
        lowerbH=hue_yellow[0]
        lowerbS=hue_yellow[1]
        lowerbV=hue_yellow[2]
        upperbH=hue_yellow[3]
        upperbS=hue_yellow[4]
        upperbV=hue_yellow[5]

        mask1=cv2.inRange(hsv,(lowerbH,lowerbS,lowerbV),(upperbH,upperbS,upperbV))
        mask2=cv2.inRange(hsv,(lowerbH+165,lowerbS,lowerbV),(upperbH+170,upperbS,upperbV))
        mask = cv2.bitwise_or(mask1, mask2)

        h, w, d = image.shape       
        search_top = h*mask_y_top
        search_bot = h*mask_y_bot
        mask[0:int(search_top), 0:w] = 0
        mask[int(search_bot):h, 0:w] = 0
        mask[0:h, 0:int(mask_x_left*w)] = 0
        mask[0:h, int(mask_x_right*w):w] = 0
        
        # 计算mask图像的重心，即几何中心
        M = cv2.moments(mask)
        if M['m00'] > 0:
            cx = int(M['m10']/M['m00'])
            cy = int(M['m01']/M['m00'])
            cv2.circle(image, (cx, cy), 10, (255, 0, 255), -1)

            if cv2.circle:
            # 计算图像中心线和目标指示线中心的距离
                erro = cx - w*center_target
                d_erro=erro-last_erro
                
                self.twist.linear.x = vel_x
                # rospy.loginfo("Point cx is %d "%cx)  
                # rospy.loginfo("Point cy is %d"%cy)
                # rospy.loginfo("Point outside is %d"%self.outside.data) 
                # rospy.loginfo("point state_last is %d"%state_last)
                # rospy.loginfo("point state is %d"%state)
                # rospy.loginfo("Point HSV is %s"%hsv[int(hsv.shape[0]/2),int(hsv.shape[1]/2)]) 
                if erro!=0 and state == state_last != 0:
                    self.twist.angular.z = -float(erro)*vel_z_P-float(d_erro)*vel_z_D
                    # self.twist.linear.y = float(erro)*vel_y_P-float(d_erro)*vel_y_D
                    if self.twist.linear.y > 0.2:
						self.twist.linear.y = 0.2
                    if cx >300 and cy>170 and state == state_last == 4:
                        self.twist.angular.z = 0
                        self.cmd_vel_pub.publish(self.twist)
                        sleep(0.5)
                    if cx > 75 and cx < 81 and cy>170 and cy<180 and state == state_last == 4:
                        self.outside.data = 1
                        self.go_outside_pub.publish(self.outside)
                        
                elif erro == 0 and state == state_last != 0:
                    self.twist.angular.z = 0
                    self.twist.linear.y = 0 
                elif state != state_last:
                    if state_last == 0:
                        state_last = state
                    else:
                        state_last = state
                last_erro=erro
        else:
            self.twist.angular.z = 0
        if state > 0:
            self.cmd_vel_pub.publish(self.twist)
            if state == 1:
                cv2.putText(mask, "out_way", (0,30),cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255,255,255),1)
            elif state == 4:
                cv2.putText(mask, "in_way", (0,30),cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255,255,255),1)
        else :
            cv2.putText(mask, "no_line_init", (0,30),cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255,255,255),1)

        cv2.imshow("watch_line", mask)
        cv2.waitKey(1)
        self.start_flag_pub.publish(self.flag)


    def driver_mode_callback(self, msg): 
        global mask_x_left
        global mask_x_right
        global mask_y_top
        global mask_y_bot
        global center_target
        global vel_x
        global vel_y_P
        global vel_y_D
        global vel_z_P
        global vel_z_D
        global state
        mask_x_left = msg.mask_x_left
        mask_x_right = msg.mask_x_right
        mask_y_top = msg.mask_y_top
        mask_y_bot = msg.mask_y_bot
        center_target = msg.center_target
        vel_x = msg.vel_x
        vel_y_P = msg.vel_y_P
        vel_y_D = msg.vel_y_D
        vel_z_P = msg.vel_z_P
        vel_z_D = msg.vel_z_D
        state = msg.en

rospy.init_node("opencv")
follower = Follower()
rospy.spin()



