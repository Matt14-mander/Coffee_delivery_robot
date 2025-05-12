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
# 机器人多点导航功能节点，接收并标记点位置，发布机器人导航点
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

from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray
from geometry_msgs.msg import PointStamped, PoseStamped
from std_msgs.msg import Int8
from move_base_msgs.msg import *

import rospy
import math
import actionlib
import sys, select, termios, tty
import time
import tf

#到达目标点成功或失败的回调函数
def pose_callback(msg):

    global index, count, try_again,finsh

    #print ('Debug output msg.status.status '+str(msg.status.status))

    #成功到达目标点，前往下一目标点
    if msg.status.status == 3:  

        #还有未到达最后的目标点，继续导航到下一个目标点
        if index < count:
            print ('Reach the target point '+str(index)+', going to next point ' +str(index+1) +'\r\n'+
                    'x:'+str(markerArray_number.markers[index].pose.position.x)+
                ', y:'+str(markerArray_number.markers[index].pose.position.y)+
                ', z:'+str(markerArray_number.markers[index].pose.orientation.z)+
                ', w:'+str(markerArray_number.markers[index].pose.orientation.w)) 

            #目标点序号+1
            index += 1 

            #发布下一个目标点
            pose = PoseStamped()
            pose.header.frame_id = 'map'
            pose.header.stamp = rospy.Time.now()
            pose.pose.position.x = markerArray_number.markers[index-1].pose.position.x
            pose.pose.position.y = markerArray_number.markers[index-1].pose.position.y
            pose.pose.orientation.z = markerArray_number.markers[index-1].pose.orientation.z
            pose.pose.orientation.w = markerArray_number.markers[index-1].pose.orientation.w
            goal_pub.publish(pose)

        #所有目标点导航完成
        elif index == count:
            print ('Reach the last target point '+str(index)+', Please input new target point......'+'\r\n') 

            finsh = 1

    #到达当前目标点失败,非取消目标任务  
    elif msg.status.status != 2:

        #第一次未成功到达目标点，则再发布一次未到达目标点，尝试是否可以到达
        if try_again == 0:    

            #再发布一次未到达目标点，尝试是否可以到达
            rospy.logwarn('Can not reach the target point, trying again to point '+str(index)+'\r\n'+
                            'x:'+str(markerArray_number.markers[index-1].pose.position.x)+
                        ', y:'+str(markerArray_number.markers[index-1].pose.position.y)+
                        ', z:'+str(markerArray_number.markers[index-1].pose.orientation.z)+
                        ', w:'+str(markerArray_number.markers[index-1].pose.orientation.w)) 

            pose = PoseStamped()
            pose.header.frame_id = 'map'
            pose.header.stamp = rospy.Time.now()
            pose.pose.position.x = markerArray_number.markers[index - 1].pose.position.x           
            pose.pose.position.y = markerArray_number.markers[index - 1].pose.position.y
            pose.pose.orientation.z = markerArray_number.markers[index-1].pose.orientation.z
            pose.pose.orientation.w = markerArray_number.markers[index-1].pose.orientation.w
            goal_pub.publish(pose)

            try_again = 1

        #尝试一次未成功，放弃尝试，停止导航或继续前往下一个目标点
        else:

            #如果还有未完成的目标点，则前往下一个目标点
            if index < count:  

                #下一次要发布的目标点序号
                index += 1 

                rospy.logwarn('try reach the target point failed!  reach next point '+str(index)+'\r\n'+
                            'x:'+str(markerArray_number.markers[index-1].pose.position.x)+
                            ', y:'+str(markerArray_number.markers[index-1].pose.position.y)+
                            ', z:'+str(markerArray_number.markers[index-1].pose.orientation.z)+
                            ', w:'+str(markerArray_number.markers[index-1].pose.orientation.w)) 

                pose = PoseStamped()
                pose.header.frame_id = 'map'
                pose.header.stamp = rospy.Time.now()
                pose.pose.position.x = markerArray_number.markers[index-1].pose.position.x      
                pose.pose.position.y = markerArray_number.markers[index-1].pose.position.y
                pose.pose.orientation.z = markerArray_number.markers[index-1].pose.orientation.z
                pose.pose.orientation.w = markerArray_number.markers[index-1].pose.orientation.w
                goal_pub.publish(pose)

            #否则，提示不能到达最后一个目标点
            else:
                rospy.logwarn('Can not reach the last point, Please input new target point...... ')

            #允许再次尝试前往尚未抵达的该目标点
            try_again = 0 

#Rviz 发布点按钮回调函数，参数为按下的位置[x, y, z=0]
def click_callback(msg):     

    global index, count, finsh
    global markerArray, markerArray_number
    global goal_pub, mark_pub, result_pub

    #目标点数量增加
    count += 1 

    #提示添加了一个新的目标点
    print('Add a new target  '+str(count)+'.'+'\r\n'+
            'x:'+str(msg.point.x)+', y:'+str(msg.point.y)+', z:0'+', w:1') 

    #创建marker对象，RVIZ地图上标记目标点
    marker_number = Marker()    
    marker_number.header.frame_id = 'map'  #TF坐标
    marker_number.type = marker_number.TEXT_VIEW_FACING  #字符格式
    marker_number.action = marker_number.ADD  #添加marker
    marker_number.scale.x = 0.3  #marker大小
    marker_number.scale.y = 0.3  #marker大小
    marker_number.scale.z = 0.3  #marker大小
    marker_number.color.a = 1  #字符透明度
    marker_number.color.r = 0  #字符颜色R(红色)通道
    marker_number.color.g = 0  #字符颜色G(绿色)通道
    marker_number.color.b = 1  #字符颜色B(蓝色)通道
    marker_number.pose.position.x = msg.point.x  #字符位置
    marker_number.pose.position.y = msg.point.y  #字符位置
    marker_number.pose.position.z = 0.1   #字符位置
    marker_number.pose.orientation.z = 0  #字符位置
    marker_number.pose.orientation.w = 1  #字符位置
    marker_number.text = str(count)   #字符内容

    #添加元素进数组
    markerArray_number.markers.append(marker_number) 

    #markers的id不能一样，否则rviz只会识别最后一个元素
    #遍历marker分别给id赋值
    id = 0
    for m in markerArray_number.markers:    
        m.id = id
        id += 1
    
    #发布markerArray，rviz订阅并进行可视化
    mark_pub.publish(markerArray_number) 

    #第一次添加marker时直接发布目标点
    if count == 1:
        #创建目标点对象
        pose = PoseStamped() 
        pose.header.frame_id = 'map'  #以哪一个TF坐标为原点
        pose.header.stamp = rospy.Time.now()
        pose.pose.position.x = msg.point.x  #目标点位置
        pose.pose.position.y = msg.point.y  #目标点位置
        pose.pose.orientation.z = 0  #四元数，到达目标点后小车的方向，z=sin(angle/2)
        pose.pose.orientation.w = 1  #四元数，到达目标点后小车的方向，w=cos(angle/2)
        goal_pub.publish(pose)

    #非第一次，目标点由导航结果回调函数发布
    else :

        #如果机器人已完成所有导航任务，此时处于静止状态，
        if finsh == 1:
            #人为发布状态3结果使机器人导航到新增加的目标点
            move =MoveBaseActionResult()
            move.status.status = 3
            move.header.stamp = rospy.Time.now()
            result_pub.publish(move)   

            finsh = 0
        
def init_multi():

    global markerArray, markerArray_number
    global count, index, try_again,finsh
    global goal_pub, mark_pub,result_pub

    markerArray = MarkerArray() #目标点标记数组
    markerArray_number = MarkerArray() #目标点标记数组

    count = 0  #总的目标点计数
    index = 1  #当前目标点序列数
    finsh = 0  #是否完成所有导航任务
    try_again = 0  #失败到达目标点后，可以再尝试一次标记

    #初始化节点  
    rospy.init_node('xtark_multi_node')   

    #用于发布目标点标记
    mark_pub    = rospy.Publisher('/path_point', MarkerArray, queue_size = 100) 
    #订阅rviz内标记按下的位置
    click_sub   = rospy.Subscriber('/clicked_point', PointStamped, click_callback) 
    #用于发布目标点
    goal_pub    = rospy.Publisher('/move_base_simple/goal', PoseStamped, queue_size = 1) 
    #用于发布到达结果
    result_pub = rospy.Publisher('/move_base/result',MoveBaseActionResult,queue_size=1)
    #用于订阅是否到达目标点状态
    goal_status_sub = rospy.Subscriber('/move_base/result', MoveBaseActionResult, pose_callback)     
 
    #多点导航启动
    rospy.loginfo('Mulit mark point nav is running...... ')

if __name__ == '__main__':
    try: 

        #节点初始化
        init_multi()

        rospy.spin()

    except KeyboardInterrupt:
        print("shutting down")

