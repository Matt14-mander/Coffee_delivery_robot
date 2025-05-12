#!/usr/bin/env python2
#coding=utf-8
#################################################################################
# Copyright 2022 XTARK CO., LTD. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#################################################################################
# Authors: Hank #
# robot_pose_ekf节点发布的里程计消息为geometry_msgs/PoseWithCovarianceStamped
# 变换为标准的里程计消息nav_msgs/Odometry
#################################################################################

import roslib
import rospy
from   geometry_msgs.msg import PoseWithCovarianceStamped
from   nav_msgs.msg      import Odometry

class OdomTRANS():
    def __init__(self):
        
        rospy.init_node('odom_trans', anonymous=False)

        # 定义发布器nav_msgs/Odometry
        self.odom_pub = rospy.Publisher('output', Odometry,queue_size=10)
        
        # 等待/odom_combined消息
        rospy.wait_for_message('input', PoseWithCovarianceStamped)
        
        # 订阅/odom_combined话题
        rospy.Subscriber('input', PoseWithCovarianceStamped, self.do_Msg)
        
        rospy.loginfo("Publishing combined odometry on /odom_trans")
        
    def do_Msg(self, msg):
        odom = Odometry()
        odom.header = msg.header
        odom.child_frame_id = 'base_footprint'
        odom.pose = msg.pose
        
        self.odom_pub.publish(odom)
        
if __name__ == '__main__':
    try:
        OdomTRANS()
        rospy.spin()
    except:
        pass

