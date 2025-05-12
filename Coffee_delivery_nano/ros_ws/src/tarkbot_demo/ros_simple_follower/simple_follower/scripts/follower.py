#!/usr/bin/env python
#coding=utf-8
# test mail: chutter@uos.de

import rospy
import thread, threading
import time
import numpy as np
from sensor_msgs.msg import Joy, LaserScan
from geometry_msgs.msg import Twist, Vector3
from dynamic_reconfigure.server import Server
from simple_follower.msg import position as PositionMsg
from std_msgs.msg import String as StringMsg
from simple_follower.cfg import PID_reconfigConfig
from std_msgs.msg import Int8
# PID的参数
KP=[1.2, 1.0]
KI=[0, 0]
KD=[0, 0]
# 跟随距离参数
targetDist = 0.3

class Follower:
	def __init__(self):
		global targetDist
		# as soon as we stop receiving Joy messages from the ps3 controller we stop all movement:
		# 当我们停止接收来自ps3控制器的Joy消息时，我们将停止所有移动:
		# 当失去连接时，将速度置零
		self.controllerLossTimer = threading.Timer(1, self.controllerLoss) #if we lose connection
		self.controllerLossTimer.start() # 启动线程
		# 若该值设置为False，则必须一直按O键才能移动 
		self.switchMode= rospy.get_param('~switchMode') # if this is set to False the O button has to be kept pressed in order for it to move
		self.max_speed = rospy.get_param('~maxSpeed') # 获取速度上限
		self.controllButtonIndex = rospy.get_param('~controllButtonIndex') 

		# self.buttonCallbackBusy=False
		# 停止运动参数
		self.active=False
		self.i=0
		self.cmdVelPublisher = rospy.Publisher('/cmd_vel', Twist, queue_size =3)
        # 
		# the topic for the tracker that gives us the current position of the object we are following
		self.positionSubscriber = rospy.Subscriber('/object_tracker/current_position', PositionMsg, self.positionUpdateCallback)
		# an info string from that tracker. E.g. telling us if we lost the object
		self.trackerInfoSubscriber = rospy.Subscriber('/object_tracker/info', StringMsg, self.trackerInfoCallback)
		self.srv = Server(PID_reconfigConfig,self.dynamic_reconfigure_callback)
		# PID参数首先是角，距离
		# PID parameters first is angular, dist 
		# 获取中距值
		targetDist = rospy.get_param('~targetDist') 
		# 获取PID值 [角度,距离]
		PID_param = rospy.get_param('~PID_controller') 
		self.KP=[0, 0]
		self.KI=[0, 0]
		self.KD=[0, 0]
		# the first parameter is the angular target (0 degrees always) the second is the target distance (say 1 meter)
		# 第一个参数是角度目标（始终为0度），第二个参数是目标距离（例如1米）
		self.PID_controller = simplePID([0, targetDist], PID_param['P'], PID_param['I'], PID_param['D'])

		# this method gets called when the process is killed with
		# Ctrl+C当使用Ctrl+C终止进程时，将调用此方法
		rospy.on_shutdown(self.controllerLoss)

	def publish_flag(self):
		
		laser_follow_flag=Int8()
		laser_follow_flag.data=1
		laserfwflagPublisher.publish(laser_follow_flag)

	# PID的服务函数
	def dynamic_reconfigure_callback(self,config,level):
		global targetDist
		KP[0] = config.Kp1
		KP[1] = config.Kp2
		KI[0] = config.Ki1
		KI[1] = config.Ki2
		KD[0] = config.Kd1
		KD[1] = config.Kd2
		self.PID_controller = simplePID([0, targetDist], KP, KI, KD)
		return config
	def trackerInfoCallback(self, info):
		# we do not handle any info from the object tracker specifically at the moment. just ignore that we lost the object for example
		rospy.logwarn(info.data)

	# 当我们收到一个新位置时，就会被调用。然后它将更新motorcommand
	def positionUpdateCallback(self, position):
		
		if (position.angleX < (-3.14)) : 
			#更新角度数据
			angleX = position.angleX + 6.2830
		else:
			# 与目标之间的角度
			angleX = position.angleX 
		# 与目标之间的距离
		distance = position.distance 
		# 输出当前的偏差距离和偏差角度
		rospy.loginfo('Angle: {}, Distance: {}, '.format(angleX, distance)) #输出当前的偏差距离和偏差角度

        # call the PID controller to update it and get new speeds
        # 调用PID控制器来更新它并获得新的速度
		[uncliped_ang_speed, uncliped_lin_speed] = self.PID_controller.update([angleX, distance])
	
        # clip these speeds to be less then the maximal speed specified above
        # 将这些速度限制为低于规定的最大速度
		angularSpeed = np.clip(-uncliped_ang_speed, -self.max_speed, self.max_speed)
		linearSpeed  = np.clip(-uncliped_lin_speed, -self.max_speed, self.max_speed)

        # create the Twist message to send to the cmd_vel topic 
        # 创建要发送到cmd_vel主题的Twist消息
		velocity = Twist()	
		velocity.linear = Vector3(linearSpeed,0,0.)
		velocity.angular= Vector3(0., 0.,angularSpeed)
		rospy.loginfo('linearSpeed: {}, angularSpeed: {}'.format(linearSpeed, angularSpeed))
		self.cmdVelPublisher.publish(velocity)
		if self.i < 10:
			self.i = self.i +1
		elif self.i == 10:		#语音识别标志
			self.publish_flag()
			self.i = 11	

	# 停止运动，将速度置0
	def stopMoving(self):
		velocity = Twist()
		velocity.linear = Vector3(0.,0.,0.)
		velocity.angular= Vector3(0.,0.,0.)
		self.cmdVelPublisher.publish(velocity)

	def controllerLoss(self):
		# we lost connection so we will stop moving and become inactive 
		# 我们失去了联系，因此我们将停止移动并变得不活跃
		self.stopMoving()
		self.active = False
		rospy.loginfo('lost connection')


#PID调试函数 
class simplePID:
	'''very simple discrete PID controller'''
	def __init__(self, target, P, I, D):
		'''Create a discrete PID controller
		each of the parameters may be a vector if they have the same length
		
		Args:
		target (double) -- the target value(s)
		P, I, D (double)-- the PID parameter

		Args:
		target(double)——目标值
		P, I, D (double)——PID参数

		'''

		# check if parameter shapes are compatabile. 
		if(not(np.size(P)==np.size(I)==np.size(D)) or ((np.size(target)==1) and np.size(P)!=1) or (np.size(target )!=1 and (np.size(P) != np.size(target) and (np.size(P) != 1)))):
			raise TypeError('input parameters shape is not compatable')
		rospy.loginfo('PID initialised with P:{}, I:{}, D:{}'.format(P,I,D))
		self.Kp		=np.array(P)
		self.Ki		=np.array(I)
		self.Kd		=np.array(D)
		self.setPoint   =np.array(target)
		
		self.last_error=0
		self.integrator = 0
		self.integrator_max = float('inf')
		self.timeOfLastCall = None 
		
		
	def update(self, current_value):
		'''Updates the PID controller. 

		Args:
			current_value (double): vector/number of same legth as the target given in the constructor

		Returns:
			controll signal (double): vector of same length as the target

		'''
		current_value=np.array(current_value)
		if(np.size(current_value) != np.size(self.setPoint)):
			raise TypeError('current_value and target do not have the same shape')
		if(self.timeOfLastCall is None):
			# the PID was called for the first time. we don't know the deltaT yet PID第一次被调用，此时我们还不知道时间差
			# no controll signal is applied 没有控制信号可用
			# self.timeOfLastCall = time.perf_counter()
			self.timeOfLastCall = time.clock()
			return np.zeros(np.size(current_value))

		
		error = self.setPoint - current_value
		# 偏差较小时停止移动
		if error[0]<0.1 and error[0]>-0.1: # error[0]为角度偏差
			error[0]=0
		if error[1]<0.03 and error[1]>-0.03: # error[1]为距离偏差
			error[1]=0

        # when target is little, amplify velocity by amplify error 
        # 当目标很小时，通过放大误差来提高速度
		if error[1]>0 and self.setPoint[1]<0.6:	
			error[1]=error[1]*(0.6/self.setPoint[1])
		P =  error
		# 输出当前的PID值，调试时使用
		# rospy.loginfo('PID initialised with P:{}, I:{}, D:{}'.format(self.Kp, self.Ki, self.Kd))
		# currentTime = time.perf_counter()
		currentTime = time.clock()
		deltaT      = (currentTime-self.timeOfLastCall)

		# integral of the error is current error * time since last update  积分项 当前错误*自上次更新以来的时间
		self.integrator = self.integrator + (error*deltaT)
		I = self.integrator
		
		# derivative is difference in error / time since last update       微分项 误差的差值 / 时间差
		D = (error-self.last_error)/deltaT
		
		self.last_error = error
		self.timeOfLastCall = currentTime
		
		# return controll signal                                           返回控制量
		return self.Kp*P + self.Ki*I + self.Kd*D
		
		
	

			




if __name__ == '__main__':
	print('starting')
	laserfwflagPublisher = rospy.Publisher('/laser_follow_flag', Int8, queue_size =1)
	rospy.init_node('follower')
	follower = Follower()
	try:
		rospy.spin()
	except rospy.ROSInterruptException:
		print('exception')


