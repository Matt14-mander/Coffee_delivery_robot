#!/usr/bin/env python
# coding=utf-8

import rospy
from std_msgs.msg import Int8
from sensor_msgs.msg import Image
from std_msgs.msg import String
import cv2, cv_bridge
import numpy
import os
import sys
from tarkbot_driver_yolo.msg import ControlWay
import threading
import time
from geometry_msgs.msg import Twist
from tarkbot_yolov5.msg import *


from dynamic_reconfigure.server import Server
from tarkbot_driver_yolo.cfg import paramsConfig


# outer_ring_image_x_left = 0
# outer_ring_image_x_right = 0.5
# outer_ring_image_y_top = 0.5
# outer_ring_image_y_bot = 0.5
# outer_ring_center_target = 0.20
# outer_ring_vel_x = 0.15
# outer_ring_vel_y_P = 0
# outer_ring_vel_y_D = 0
# outer_ring_vel_z_P = 0.01
# outer_ring_vel_z_D = 0.001

# Inner_ring_mask_x_left = 0.5
# Inner_ring_mask_x_right = 1
# Inner_ring_mask_y_top = 0.5
# Inner_ring_mask_y_bot = 1
# Inner_ring_center_target = 0.925
# Inner_ring_vel_x = 0.1
# Inner_ring_vel_y_P = 0.001
# Inner_ring_vel_y_D = 0.003
# Inner_ring_vel_z_P = 0.006
# Inner_ring_vel_z_D = 0.001

outer_ring_image_x_left = 0
outer_ring_image_x_right = 0.6
outer_ring_image_y_top = 0.6
outer_ring_image_y_bot = 0.85
outer_ring_center_target = 0.20
outer_ring_vel_x = 0.15
outer_ring_vel_y_P = 0
outer_ring_vel_y_D = 0
outer_ring_vel_z_P = 0.007
outer_ring_vel_z_D = 0.001

Inner_ring_mask_x_left = 0.5
Inner_ring_mask_x_right = 1
Inner_ring_mask_y_top = 0.6
Inner_ring_mask_y_bot = 0.85
Inner_ring_center_target = 0.925
Inner_ring_vel_x = 0.1
Inner_ring_vel_y_P = 0.001
Inner_ring_vel_y_D = 0.003
Inner_ring_vel_z_P = 0.006
Inner_ring_vel_z_D = 0.001



hue_red = (0,70,60,10,255,255)
hue_yellow = (15,70,50,30,255,255)
hue_blue = (100,43,46,124,255,255)
hue_green= (50,55,65,85,255,255)

side_flag = 0
stop_flag = 0
start_flag = 0
go_outside_flag = 0
last_tarkbot_driver_way = 0
last_side = 0
stop_back_run = 0
stop_temp = 0
park_temp = 0
park_flag = 0
park_restart = 0

driver_mode_pub = rospy.Publisher("/driver_mode", ControlWay, queue_size=1)

def thread_job():
	rospy.spin()

def start_flag_callback(msg):
	global start_flag
	start_flag = msg.data

def outside_flag_callback(msg):
	global go_outside_flag
	go_outside_flag = msg.data

def park_restart_callback(msg):
	global park_restart
	if msg.data == "start":
		park_restart = 1


def side_flag_callback(msg):
	global side_flag
	global stop_flag
	global stop_back_run
	global stop_temp
	global park_temp
	global park_flag

	if msg.data == [] or msg.data[0].frame_id == "Green_light":
		if stop_flag == 1:
			stop_temp = stop_temp + 1
			print("stop_temp=%d"%stop_temp)
			if stop_temp > 15:
				stop_back_run = 1
				stop_flag = 0
				print("stop_temp=%d"%stop_temp)
				stop_temp = 0
	elif msg.data[0].frame_id == "Turn_right":
		if msg.data[0].ptx > 455 and msg.data[0].pty < 178 and msg.data[0].distw > 60:
			side_flag = 2
			# pass
	elif msg.data[0].frame_id == "Red_light":
		if msg.data[0].ptx > 450 and msg.data[0].pty < 35 and msg.data[0].pty > 20:  #pro
			stop_flag = 1
			stop_temp = 0
	elif msg.data[0].frame_id == "Parking_lotB" or msg.data[0].frame_id == "Parking_lotA":
		if msg.data[0].ptx > 550 and msg.data[0].pty < 180 and msg.data[0].distw > 45 and msg.data[0].distw < 60:
			park_flag = 1
			# pass
	
	
def ctrl_data(tarkbot_driver_way, side):
	global outer_ring_image_x_left
	global outer_ring_image_x_right
	global outer_ring_image_y_top
	global outer_ring_image_y_bot
	global outer_ring_center_target
	global outer_ring_vel_x
	global outer_ring_vel_y_P
	global outer_ring_vel_y_D
	global outer_ring_vel_z_P
	global outer_ring_vel_z_D

	global Inner_ring_mask_x_left
	global Inner_ring_mask_x_right
	global Inner_ring_mask_y_top
	global Inner_ring_mask_y_bot
	global Inner_ring_center_target
	global Inner_ring_vel_x
	global Inner_ring_vel_y_P
	global Inner_ring_vel_y_D
	global Inner_ring_vel_z_P
	global Inner_ring_vel_z_D
	drivermode = ControlWay()
	if tarkbot_driver_way == 1:
		if side == 1:	#寻左线行驶
			drivermode.mask_x_left = outer_ring_image_x_left
			drivermode.mask_x_right = outer_ring_image_x_right
			drivermode.mask_y_top = outer_ring_image_y_top
			drivermode.mask_y_bot = outer_ring_image_y_bot
			drivermode.center_target = outer_ring_center_target
			drivermode.vel_x = outer_ring_vel_x
			drivermode.vel_y_P = outer_ring_vel_y_P
			drivermode.vel_y_D = outer_ring_vel_y_D
			drivermode.vel_z_P = outer_ring_vel_z_P
			drivermode.vel_z_D = outer_ring_vel_z_D
			drivermode.en = 1
	elif tarkbot_driver_way == 2:
		if side == 2:	#寻左线行驶
			drivermode.mask_x_left = outer_ring_image_x_left
			drivermode.mask_x_right = outer_ring_image_x_right
			drivermode.mask_y_top = outer_ring_image_y_top
			drivermode.mask_y_bot = outer_ring_image_y_bot
			drivermode.center_target = outer_ring_center_target
			drivermode.vel_x = outer_ring_vel_x
			drivermode.vel_y_P = outer_ring_vel_y_P
			drivermode.vel_y_D = outer_ring_vel_y_D
			drivermode.vel_z_P = outer_ring_vel_z_P
			drivermode.vel_z_D = outer_ring_vel_z_D
			drivermode.en = 4
	return drivermode
	

def reconfigCB(config,level):

	global last_tarkbot_driver_way
	global last_side

	global outer_ring_center_target
	global outer_ring_vel_z_P
	global outer_ring_vel_z_D

	global Inner_ring_center_target
	global Inner_ring_vel_y_P
	global Inner_ring_vel_y_D
	global Inner_ring_vel_z_P
	global Inner_ring_vel_z_D

	outer_ring_center_target = config.outer_ring_center_target
	outer_ring_vel_z_P = config.outer_ring_vel_z_P
	outer_ring_vel_z_D = config.outer_ring_vel_z_D

	Inner_ring_center_target = config.Inner_ring_center_target
	Inner_ring_vel_y_P = config.Inner_ring_vel_y_P
	Inner_ring_vel_y_D = config.Inner_ring_vel_y_D
	Inner_ring_vel_z_P = config.Inner_ring_vel_z_P
	Inner_ring_vel_z_D = config.Inner_ring_vel_z_D 

	if last_tarkbot_driver_way != 0:
		drivermode_pub = ctrl_data(last_tarkbot_driver_way, last_side)
		driver_mode_pub.publish(drivermode_pub)

	return config

def control_drive():
	global last_tarkbot_driver_way
	global last_side
	tarkbot_driver_way = 0 
	side = 0  
	i = 0
	global side_flag
	global stop_flag
	global start_flag
	global go_outside_flag
	global stop_back_run
	global park_flag
	global park_restart

	global outer_ring_center_target
	global outer_ring_vel_z_P
	global outer_ring_vel_z_D

	global Inner_ring_center_target
	global Inner_ring_vel_y_P
	global Inner_ring_vel_y_D
	global Inner_ring_vel_z_P
	global Inner_ring_vel_z_D

	drivermode_pub = ControlWay()
	decelerate = Int8()
	msg = Int8()

	rospy.init_node("control_drive")
	
	add_thread = threading.Thread(target = thread_job)
	add_thread.start
	
	
	cmdvel_pub = rospy.Publisher("/cmd_vel", Twist, queue_size=1)
	side_flag_sub = rospy.Subscriber("Yolov5object", ObjectArray, side_flag_callback)
	start_flag_sub = rospy.Subscriber("/start_flag", Int8, start_flag_callback)
	outside_flag_sub = rospy.Subscriber("/outside_flag", Int8, outside_flag_callback)
	park_restart_flag_sub = rospy.Subscriber("/park_restart_flag", String, park_restart_callback)
	

	dynamic_reconfigure_server = Server(paramsConfig, reconfigCB)

	outer_ring_center_target = rospy.get_param('~outer_ring_center_target', 0.26)
	outer_ring_vel_z_P = rospy.get_param('~outer_ring_vel_z_P', 0.01) 
	outer_ring_vel_z_D = rospy.get_param('~outer_ring_vel_z_D', 0.001) 

	Inner_ring_center_target = rospy.get_param('~Inner_ring_center_target', 0.75) 
	Inner_ring_vel_y_P = rospy.get_param('~Inner_ring_vel_y_P', 0.001) 
	Inner_ring_vel_y_D = rospy.get_param('~Inner_ring_vel_y_D', 0.003) 
	Inner_ring_vel_z_P = rospy.get_param('~Inner_ring_vel_z_P', 0.006) 
	Inner_ring_vel_z_D = rospy.get_param('~Inner_ring_vel_z_D', 0.001) 
	
	rate = rospy.Rate(100)
	
	while not rospy.is_shutdown():
		if start_flag == 1:
			if tarkbot_driver_way == 0:  
				side = 1
				tarkbot_driver_way = 1
				last_tarkbot_driver_way = tarkbot_driver_way
				last_side = side
				drivermode_pub = ctrl_data(tarkbot_driver_way, side)
				driver_mode_pub.publish(drivermode_pub)
				print("outer_ring")
				side = 0

			
			elif tarkbot_driver_way == 1:
				if i % 150 == 0:
					print("outleft")

				if side_flag == 1:
					side = 1
					side_flag = 0
				elif side_flag == 2:
					side = 2
					side_flag = 0

				if side == 2:
					car_stop = ControlWay()
					driver_mode_pub.publish(car_stop)
					carmove = Twist()
					carmove.linear.x = 0.15
					carmove.angular.z = 0
					cmdvel_pub.publish(carmove)
					time.sleep(1)
					carmove.linear.x = 0.15
					carmove.angular.z = -1.5
					cmdvel_pub.publish(carmove)
					time.sleep(4.2)
					carmove.linear.x = 0.15
					carmove.angular.z = 0
					cmdvel_pub.publish(carmove)
					tarkbot_driver_way = 2
					last_tarkbot_driver_way = tarkbot_driver_way
					last_side = side

					drivermode_pub = ctrl_data(tarkbot_driver_way, side)
					driver_mode_pub.publish(drivermode_pub)
					print("Inner_ring")
					side = 0
					side_flag = 0
					time.sleep(2)
					temp4 = 0
			elif tarkbot_driver_way == 2:		
				if i % 150 == 0:
					print("inside")

				if go_outside_flag == 1 and stop_flag == 0:
					print("start_outside")
					car_stop = ControlWay()
					driver_mode_pub.publish(car_stop)
					carmove = Twist()
					carmove.linear.x = 0.15
					carmove.angular.z = -1.5
					cmdvel_pub.publish(carmove)
					time.sleep(4)
					print("turn_over")
					tarkbot_driver_way = 1
					side = 1
					last_tarkbot_driver_way = tarkbot_driver_way
					last_side = side
					drivermode_pub = ctrl_data(tarkbot_driver_way, side)
					driver_mode_pub.publish(drivermode_pub)
					side = 0
					go_outside_flag = 0
					print("outleft")
				if stop_flag == 1:
					print("stop")
					car_stop = ControlWay()
					driver_mode_pub.publish(car_stop)
					carmove = Twist()
					carmove.linear.x = 0
					carmove.angular.z = 0
					cmdvel_pub.publish(carmove)
					time.sleep(3)
					if stop_back_run == 1:
						print("start")
						carmove = Twist()
						carmove.linear.x = 0.15
						carmove.angular.z = 0
						cmdvel_pub.publish(carmove)
						time.sleep(2)
						drivermode_pub = ctrl_data(last_tarkbot_driver_way, 2)
						driver_mode_pub.publish(drivermode_pub)
						stop_back_run = 0
						stop_flag = 0
						print("Inner_ring")
				if park_flag == 1:
					print("part time")
					car_stop = ControlWay()
					driver_mode_pub.publish(car_stop)
					carmove = Twist()
					carmove.linear.x = 0.15
					carmove.angular.z = 0
					cmdvel_pub.publish(carmove)
					time.sleep(6.2)
					carmove.linear.x = -0.15
					carmove.angular.z = 2.0
					cmdvel_pub.publish(carmove)
					time.sleep(2.5)
					carmove.linear.x = -0.15
					carmove.angular.z = 0
					cmdvel_pub.publish(carmove)
					time.sleep(1.3)
					carmove.linear.x = -0.15
					carmove.angular.z = -2.0
					cmdvel_pub.publish(carmove)
					time.sleep(2.5)
					carmove.linear.x = 0
					carmove.angular.z = 0
					cmdvel_pub.publish(carmove)
					park_flag = 0
				if park_restart == 1:
					carmove = Twist()
					carmove.linear.x = 0.1
					carmove.angular.z = 2.5
					cmdvel_pub.publish(carmove)
					time.sleep(4.5)
					carmove.linear.x = 0.1
					carmove.angular.z = -2.5
					cmdvel_pub.publish(carmove)
					time.sleep(4.5)
					carmove.linear.x = -0.15
					carmove.angular.z = 0
					cmdvel_pub.publish(carmove)
					time.sleep(1)
					carmove.linear.x = 0.1
					carmove.angular.z = -2.5
					cmdvel_pub.publish(carmove)
					time.sleep(6)
					carmove.linear.x = 0
					carmove.angular.z = 0
					cmdvel_pub.publish(carmove)
					tarkbot_driver_way = 1
					side = 1
					last_tarkbot_driver_way = tarkbot_driver_way
					last_side = side
					drivermode_pub = ctrl_data(tarkbot_driver_way, side)
					driver_mode_pub.publish(drivermode_pub)
					park_restart = 0

			i = i + 1
			if i > 50000:
				i = 0
			
		else :
			print("waiting for init")
		rate.sleep()

if __name__ == '__main__':
    try:
    	control_drive()
    except rospy.ROSInterruptException:
    	pass
