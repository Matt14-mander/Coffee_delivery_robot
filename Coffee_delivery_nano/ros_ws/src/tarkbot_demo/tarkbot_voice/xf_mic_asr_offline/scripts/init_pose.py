#!/usr/bin/env python
# coding=utf-8
import rospy 

import math
import PyKDL
from geometry_msgs.msg import PoseWithCovarianceStamped


class PoseSetter(rospy.SubscribeListener):
    def __init__(self, pose, stamp, publish_time):
        self.pose = pose
        self.stamp = stamp
        self.publish_time = publish_time

        global position_x
        global position_y

        self.robot_x = rospy.get_param('~robot_x')
        self.robot_y = rospy.get_param('~robot_y')

    def peer_subscribe(self, topic_name, topic_publish, peer_publish):
        position = PoseWithCovarianceStamped()
        #从车的初始位姿
        position_x = self.pose[0] + self.robot_x
        position_y = self.pose[1] + self.robot_y


        position.pose.pose.position.x = position_x
        position.pose.pose.position.y = position_y
        (position.pose.pose.orientation.x,
         position.pose.pose.orientation.y,
         position.pose.pose.orientation.z,
         position.pose.pose.orientation.w) = PyKDL.Rotation.RPY(0, 0, self.pose[2]).GetQuaternion()
        position.pose.covariance[6*0+0] = 0.5 * 0.5
        position.pose.covariance[6*1+1] = 0.5 * 0.5
        position.pose.covariance[6*3+3] = math.pi/12.0 * math.pi/12.0
        # wait for the desired publish time
        while rospy.get_rostime() < self.publish_time:
            rospy.sleep(0.01)
        peer_publish(position)


if __name__ == '__main__':
    pose = map(float, rospy.myargv()[1:4])
    t_stamp = rospy.Time()
    t_publish = rospy.Time()
    if len(rospy.myargv()) > 4:
        t_stamp = rospy.Time.from_sec(float(rospy.myargv()[4]))
    if len(rospy.myargv()) > 5:
        t_publish = rospy.Time.from_sec(float(rospy.myargv()[5]))
    rospy.init_node('pose_init', anonymous=True)
    rospy.loginfo("Going to publish pose {} with stamp {} at {}".format(pose, t_stamp.to_sec(), t_publish.to_sec()))
    pub = rospy.Publisher("initialpose", PoseWithCovarianceStamped, PoseSetter(pose, stamp=t_stamp, publish_time=t_publish), queue_size=1)
    rospy.spin()
