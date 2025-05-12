#!/usr/bin/python
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
# Authors: Xtark Kao
# 手工输入目标点坐标，机器人依次导航到目标点，并循环运行
#################################################################################

#MoveBaseActionResult  msg.status.status

# uint8 PENDING         = 0   # The goal has yet to be processed by the action server
# uint8 ACTIVE          = 1   # The goal is currently being processed by the action server
# uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing
#                             #   and has since completed its execution (Terminal State)
# uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)
# uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due
#                             #    to some failure (Terminal State)
# uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,
#                             #    because the goal was unattainable or invalid (Terminal State)
# uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing
#                             #    and has not yet completed execution
# uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,
#                             #    but the action server has not yet confirmed that the goal is canceled
# uint8 RECALLED        = 8   # The goal received a cancel request before it started executing
#                             #    and was successfully cancelled (Terminal State)
# uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be
#                             #    sent over the wire by an action server

#################################################################################

from move_base_msgs.msg import MoveBaseActionResult
from actionlib_msgs.msg import GoalStatusArray
from geometry_msgs.msg import PoseStamped
from std_msgs.msg import String

import rospy
import string
import math
import time
import sys
import numpy as np
import tf


def pose_callback(msg):

    global point, point_id, point_num

    global loop_id, loop_num 

    global map_frame, goal_pub


# reached
    if msg.status.status == 3 :

        #循环完成
        if loop_id <= loop_num :
            #发布第一个点
            pointMsg = PoseStamped()
            pointMsg.header.stamp = rospy.Time.now()
            pointMsg.header.frame_id = map_frame
            pointMsg.pose.position.x = point[(point_id-1)*4+0]
            pointMsg.pose.position.y = point[(point_id-1)*4+1]
            pointMsg.pose.position.z = 0
            pointMsg.pose.orientation.x = 0.0
            pointMsg.pose.orientation.y = 0.0
            pointMsg.pose.orientation.z = point[(point_id-1)*4+2]
            pointMsg.pose.orientation.w = point[(point_id-1)*4+3]
            goal_pub.publish(pointMsg) 

            rospy.loginfo("Current is looping,  Loop_id = %d   Point_id = %d ",loop_id  ,point_id)   
            
            if point_id < point_num:
                point_id += 1
            else :
                point_id = 1
                loop_id += 1
        else :
            rospy.loginfo("Loop is finshed, Loop_num = %d , Bye bye! ", loop_num)

def init_loop():

    global point, point_id, point_num
    global loop_id, loop_num 
    global map_frame, goal_pub

    # 节点初始化
    rospy.init_node('xtark_loop_node', anonymous=True)

    goal_status_sub = rospy.Subscriber('move_base/result', MoveBaseActionResult, pose_callback, queue_size=10)
    goal_pub = rospy.Publisher('move_base_simple/goal', PoseStamped, queue_size=10)   

    # 获取巡航点参数
    point = rospy.get_param('~point', '[0.0, 0.0, 0.0, 0.0]')
    point = [float(x) for x in point.split(",")]

     # 获取地图坐标和循环次数
    map_frame = rospy.get_param('~map_frame', 'map' )
    loop_num = int(rospy.get_param('~loop_num', '2')) 

    # 验证点数据是否正确格式正确
    if len(point)%4 == 0:          
        
        #计算循环点数
        point_num = int(len(point)/4)
        rospy.loginfo("Robot Loop is running, Loop Num = %d   Point Num = %d .....",loop_num  ,point_num)

        #初始化点的当前序号和当前循环次数
        point_id = 1
        loop_id  = 1

        #发布第一个循环点
        time.sleep(1)
        pointMsg = PoseStamped()
        pointMsg.header.stamp = rospy.Time.now()
        pointMsg.header.frame_id = map_frame
        pointMsg.pose.position.x = point[(point_id-1)*4+0]
        pointMsg.pose.position.y = point[(point_id-1)*4+1]
        pointMsg.pose.position.z = 0
        pointMsg.pose.orientation.x = 0.0
        pointMsg.pose.orientation.y = 0.0
        pointMsg.pose.orientation.z = point[(point_id-1)*4+2]
        pointMsg.pose.orientation.w = point[(point_id-1)*4+3]
        goal_pub.publish(pointMsg) 

        rospy.loginfo("Current is looping,  Loop_id = %d   Point_id = %d ",loop_id  ,point_id)   

        point_id += 1 

    else:
        rospy.errinfo("Lengths of point data is wrong")    

    

if __name__ == "__main__":
    try:    
        
        #节点初始化
        init_loop()

        rospy.spin()

    except KeyboardInterrupt:
        print("shutting down")




