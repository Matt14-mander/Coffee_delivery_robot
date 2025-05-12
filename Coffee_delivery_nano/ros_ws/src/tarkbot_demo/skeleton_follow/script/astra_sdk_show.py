#!/usr/bin/env python
# coding=utf-8

import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import Int16
import cv2, cv_bridge
import numpy as np
from skeleton_follow.msg import astra_sdk_maskdata
from skeleton_follow.msg import astra_sdk_bodynumber
from skeleton_follow.msg import astra_sdk_bodyattitude
from skeleton_follow.msg import astra_sdk_wight_hight
from skeleton_follow.msg import astra_sdk_rgb
from skeleton_follow.msg import astra_sdk_body
import math


PI = 3.1415926535898
DEPTH_HFOV = 58.4/180*PI
DEPTH_VFOV = 45.5/180*PI
RGB_HFOV = 66.1/180*PI
RGB_VFOV = 40.2/180*PI
CHAR_THRESHOLD = 15


class Display:
    def __init__(self):
        self.bridge = cv_bridge.CvBridge()

        self.body_image_sub = rospy.Subscriber("/astra_sdk/image", Image, self.image_callback)
        self.mask_image_sub = rospy.Subscriber("/astra_sdk/mask", astra_sdk_maskdata, self.astra_sdk_maskdata_callback)
        self.bodylist_sub = rospy.Subscriber("/astra_sdk/bodynumber", astra_sdk_bodynumber, self.astra_sdk_bodynumber_callback)
        self.body_posture_sub = rospy.Subscriber("/body_posture", astra_sdk_bodyattitude, self.attitude_callback)

        self.body_display_pub = rospy.Publisher("/astra_sdk/body_display", Image, queue_size=1)
        self.recoveryid_pub = rospy.Publisher("/recoveryid", Int16, queue_size=1)
        self.mask = astra_sdk_maskdata()
        self.bodylist = astra_sdk_bodynumber()
        self.char_rgb = astra_sdk_rgb()
        self.last_char_rgb = astra_sdk_rgb()
        self.body_lockedid = 0
        self.lock_status = 0
        self.saved_char = 0
        self.saved_char_i = 0
        self.last_maskpoint = 0
        self.count_callback = 0

        #self.display_msg = Image()

    def attitude_callback(self, msg):
        self.body_lockedid = msg.bodyid
        self.lock_status = msg.lock_status

    def astra_sdk_bodynumber_callback(self, msg):
        self.bodylist = msg

    def astra_sdk_maskdata_callback(self, msg):
        self.mask = msg

    def image_callback(self, msg):
        image_ori = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        image = cv2.resize(image_ori, (640,480), interpolation=cv2.INTER_AREA)


        temp = [0] *self.bodylist.count
        for i in range(self.bodylist.count):
            temp[i] = self.bodylist.bodies[i].centerOfMass.x
            draw = [0] *19
            for j in range(19):
                centerx = int(self.bodylist.bodies[i].joints[j].depthPosition.x )
                if centerx<40 or centerx>600:
                    continue
                centery = int(self.bodylist.bodies[i].joints[j].depthPosition.y )
                if centery<40 or centery>440:
                    continue
                draw[j] = 1
            for a in [0,1,2,3,5,6,8,9,10,11,13,14]:
                if draw[a] == 1 and draw[a+1] == 1:
                    pt1_x = int(self.bodylist.bodies[i].joints[a].depthPosition.x )
                    pt1_y = int(self.bodylist.bodies[i].joints[a].depthPosition.y )
                    pt2_x = int(self.bodylist.bodies[i].joints[a+1].depthPosition.x )
                    pt2_y = int(self.bodylist.bodies[i].joints[a+1].depthPosition.y )
                    image = cv2.line(image, (pt1_x, pt1_y), (pt2_x, pt2_y), (255,255,255), 3)
            for b in [5,8]:
                if draw[1] == 1 and draw[b] == 1:
                    pt1_x = int(self.bodylist.bodies[i].joints[1].depthPosition.x )
                    pt1_y = int(self.bodylist.bodies[i].joints[1].depthPosition.y )
                    pt2_x = int(self.bodylist.bodies[i].joints[b].depthPosition.x )
                    pt2_y = int(self.bodylist.bodies[i].joints[b].depthPosition.y )
                    image = cv2.line(image, (pt1_x, pt1_y), (pt2_x, pt2_y), (255,255,255), 3)    
            if draw[9] == 1 and draw[13] == 1:
                pt1_x = int(self.bodylist.bodies[i].joints[9].depthPosition.x )
                pt1_y = int(self.bodylist.bodies[i].joints[9].depthPosition.y )
                pt2_x = int(self.bodylist.bodies[i].joints[13].depthPosition.x )
                pt2_y = int(self.bodylist.bodies[i].joints[13].depthPosition.y )
                image = cv2.line(image, (pt1_x, pt1_y), (pt2_x, pt2_y), (255,255,255), 3)
            #draw joint
            for c in range(19):
                if draw[c] == 1 :
                    centerx = int(self.bodylist.bodies[i].joints[c].depthPosition.x )
                    centery = int(self.bodylist.bodies[i].joints[c].depthPosition.y )
                    image = cv2.circle(image, (centerx, centery), 6, (0, 255, 0), -1)

            #make a mask ---record locked_body characteristics
            if self.lock_status == 2 and self.bodylist.bodies[i].bodyid == self.body_lockedid  :

                if (self.bodylist.bodies[i].joints[8].worldPosition.z > 1600
                    and self.bodylist.bodies[i].joints[8].depthPosition.x > 80
                    and self.bodylist.bodies[i].joints[8].depthPosition.x < 560 ):

                    locked_mask, width_l, width_r, height_t, height_b = self.mask_for_char(self.bodylist.bodies[i], msg)

                    if locked_mask.shape[0]!=0 and locked_mask.shape[1]!=0 and locked_mask.shape[2]!=0:
                        mask_b = locked_mask[:,:,0]
                        mask_g = locked_mask[:,:,1]
                        mask_r = locked_mask[:,:,2]
                        self.char_rgb.r = int(np.mean(mask_r))
                        self.char_rgb.g = int(np.mean(mask_g))
                        self.char_rgb.b = int(np.mean(mask_b))
                        self.saved_char = 1
                        self.saved_char_i = i
                        print(self.char_rgb)
                        print("-------------")
                        image = cv2.rectangle(image, (width_l,height_t), (width_r,height_b), (255,0,0), 4)


            elif self.lock_status == 1 and self.saved_char == 1 :
                if self.bodylist.bodies[i].joints[8].worldPosition.z != 0:
                    check_mask, width_l, width_r, height_t, height_b = self.mask_for_char(self.bodylist.bodies[i], msg)
                    if check_mask.shape[0]!=0 and check_mask.shape[1]!=0 and check_mask.shape[2]!=0:
                        mean = locked_char_rgb()
                        mean.r = int(np.mean(check_mask[:,:,2]))
                        mean.g = int(np.mean(check_mask[:,:,1]))
                        mean.b = int(np.mean(check_mask[:,:,0]))

                        if (self.char_rgb.r-CHAR_THRESHOLD < mean.r < self.char_rgb.r+CHAR_THRESHOLD
                            and self.char_rgb.g-CHAR_THRESHOLD < mean.g < self.char_rgb.g+CHAR_THRESHOLD
                            and self.char_rgb.b-CHAR_THRESHOLD < mean.b < self.char_rgb.b+CHAR_THRESHOLD):
                            #pass
                            recoveryid_msg = Int16()
                            recoveryid_msg.data = self.bodylist.bodies[i].bodyid
                            self.recoveryid_pub.publish(recoveryid_msg)


        if self.lock_status == 2 :
            lock_x = temp[self.saved_char_i]
            for d in range(self.bodylist.count):
                if d != self.saved_char_i:
                    if 100 < abs(lock_x - temp[d]):
                        self.char_rgb = self.last_char_rgb
                        break
        self.last_char_rgb = self.char_rgb



        self.body_display_pub.publish(self.bridge.cv2_to_imgmsg(image, "bgr8"))


        

    def mask_for_char(self, body, image_msg):
        bodycenterx = int(body.joints[8].depthPosition.x  )
        bodycentery = int(body.joints[8].depthPosition.y  )
        locked_mask_width  = int(250/body.joints[8].worldPosition.z * image_msg.width/math.tan(DEPTH_HFOV) )
        locked_mask_height  = int(350/body.joints[8].worldPosition.z * image_msg.height/math.tan(DEPTH_VFOV) )
        width_l = bodycenterx-locked_mask_width/2
        width_r = bodycenterx+locked_mask_width/2
        height_t = bodycentery-locked_mask_height*2/3 
        height_b = bodycentery+locked_mask_height/3
        image_temp1 = self.bridge.imgmsg_to_cv2(image_msg, desired_encoding='bgr8')
        image_temp2 = cv2.flip(image_temp1, 1)
        locked_mask = image_temp2[ height_t:height_b , width_l:width_r ]
        return locked_mask, width_l, width_r, height_t, height_b


if __name__ == '__main__':
    rospy.init_node("Skeleton display")
    display = Display()
    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        print('exception')

