#!/usr/bin/env python3
# encoding: utf-8
import base64
import sys
import time
import rospy
import rospkg
import numpy
import cv2 as cv
from tarkbot_yolov5.msg import *
from yolov5_trt import YoLov5TRT

class Yolov5:
    def __init__(self):
        rospy.on_shutdown(self.cancel)
        rospy.init_node("Yolov5", anonymous=False)
        self.pTime = self.cTime = 0
        device = rospy.get_param("~device", "nano4G")
        param_ = rospkg.RosPack().get_path("tarkbot_yolov5") + '/param/' 
        #file_yaml = param_ + 'coco.yaml'
        file_yaml = param_ + 'traffic.yaml'
        PLUGIN_LIBRARY = param_ + device + "/libmyplugins.so"
        engine_file_path = param_ + device + "/yolov5s.engine"
        self.yolov5_wrapper = YoLov5TRT(file_yaml, PLUGIN_LIBRARY, engine_file_path)
        self.pub_image = rospy.Publisher('camera/image_msg', Image_Data, queue_size=10)
        self.pub_image_raw = rospy.Publisher('camera/image_raw', Image_Data, queue_size=10)
        self.pub_msg = rospy.Publisher('Yolov5object', ObjectArray, queue_size=10)

    def cancel(self):
        self.pub_image.unregister()
        self.pub_msg.unregister()
        self.yolov5_wrapper.destroy()

    def pub_imgMsg(self, frame):
        pic_base64 = base64.b64encode(frame)
        image = Image_Data()
        size = frame.shape
        image.height = size[0]
        image.width = size[1]
        image.channels = size[2]
        image.data = pic_base64
        self.pub_image.publish(image)

    def pub_imagemsg_raw(self, frame):
        pic_base64 = base64.b64encode(frame)
        image = Image_Data()
        size = frame.shape
        image.height = size[0]
        image.width = size[1]
        image.channels = size[2]
        image.data = pic_base64
        self.pub_image_raw.publish(image)

    def detect(self,frame):
        object_array = ObjectArray()
        object = Object()
        
        frame, result_boxes, result_scores, result_classid = self.yolov5_wrapper.infer(frame)
        # Draw rectangles and labels on the original image
        for j in range(len(result_boxes)):
            box = result_boxes[j]
            self.yolov5_wrapper.plot_one_box(
                box,
                frame,
                label="{}:{:.2f}".format(
                    self.yolov5_wrapper.categories[int(result_classid[j])],
                    result_scores[j]
                ),
            )
            object.frame_id = self.yolov5_wrapper.categories[int(result_classid[j])]
            object.stamp = rospy.Time.now()
            object.scores = result_scores[j]
            # x1, y1, x2, y2
            object.ptx = box[0]
            object.pty = box[1]
            object.distw = box[2] - box[0]
            object.disth = box[3] - box[1]
            object.centerx = (box[2] - box[0]) / 2
            object.centery = (box[3] - box[1]) / 2
            object_array.data.append(object)
        self.cTime = time.time()
        fps = 1 / (self.cTime - self.pTime)
        self.pTime = self.cTime
        text = "FPS : " + str(int(fps))
        cv.putText(frame, text, (20, 30), cv.FONT_HERSHEY_SIMPLEX, 0.9, (0, 0, 255), 1)
        self.pub_msg.publish(object_array)
        self.pub_imgMsg(frame)
        return frame

if __name__ == "__main__":
    print("Python version: ", sys.version)
    capture = cv.VideoCapture(0)
    capture.set(6, cv.VideoWriter.fourcc('M', 'J', 'P', 'G'))
    capture.set(cv.CAP_PROP_FRAME_WIDTH, 640)
    capture.set(cv.CAP_PROP_FRAME_HEIGHT, 480)
    print("capture get FPS : ", capture.get(cv.CAP_PROP_FPS))
    detect = Yolov5()
    while capture.isOpened():
        ret, frame = capture.read()
        ret, img_raw = capture.read()
        # img_raw = frame.copy()
        detect.pub_imagemsg_raw(img_raw)
        detect_img = frame.copy()
        image = cv.resize(frame, (320,240), interpolation=cv.INTER_AREA)
        action = cv.waitKey(1) & 0xFF
        detect_img = detect.detect(detect_img)
        if action == ord('q'): break
        # if len(sys.argv) != 1:
        #     if sys.argv[1]=="true" or sys.argv[1]=="True": cv.imshow('frame', frame)
        # else:cv.imshow('frame', frame)
        hsv = cv.cvtColor(image, cv.COLOR_BGR2HSV)
    detect.cancel()
    capture.release()
    cv.destroyAllWindows()
