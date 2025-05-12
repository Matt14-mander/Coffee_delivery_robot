#!/usr/bin/env python3
# encoding: utf-8
import base64
import sys
import time
import rospy
import rospkg
import cv2 as cv
from yahboomcar_msgs.msg import *
from yolov5_trt import YoLov5TRT

class YoloDetect:
    def __init__(self):
        rospy.on_shutdown(self.cancel)
        rospy.init_node("YoloDetect", anonymous=False)
        self.pTime = self.cTime = 0
        device = rospy.get_param("~device", "nano4G")
        param_ = rospkg.RosPack().get_path("yahboomcar_yolov5") + '/param/' 
        #file_yaml = param_ + 'coco.yaml'
        file_yaml = param_ + 'traffic.yaml'
        PLUGIN_LIBRARY = param_ + device + "/libmyplugins.so"
        engine_file_path = param_ + device + "/yolov5s.engine"
        self.yolov5_wrapper = YoLov5TRT(file_yaml, PLUGIN_LIBRARY, engine_file_path)
        self.pub_image = rospy.Publisher('Detect/image_msg', Image_Msg, queue_size=10)
        self.pub_msg = rospy.Publisher('DetectMsg', TargetArray, queue_size=10)

    def cancel(self):
        self.pub_image.unregister()
        self.pub_msg.unregister()
        self.yolov5_wrapper.destroy()

    def pub_imgMsg(self, frame):
        pic_base64 = base64.b64encode(frame)
        image = Image_Msg()
        size = frame.shape
        image.height = size[0]
        image.width = size[1]
        image.channels = size[2]
        image.data = pic_base64
        self.pub_image.publish(image)

    def detect(self,frame):
        target_array = TargetArray()
        target = Target()
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
            target.frame_id = self.yolov5_wrapper.categories[int(result_classid[j])]
            target.stamp = rospy.Time.now()
            target.scores = result_scores[j]
            # x1, y1, x2, y2
            target.ptx = box[0]
            target.pty = box[1]
            target.distw = box[2] - box[0]
            target.disth = box[3] - box[1]
            target.centerx = (box[2] - box[0]) / 2
            target.centery = (box[3] - box[1]) / 2
            target_array.data.append(target)
        self.cTime = time.time()
        fps = 1 / (self.cTime - self.pTime)
        self.pTime = self.cTime
        text = "FPS : " + str(int(fps))
        cv.putText(frame, text, (20, 30), cv.FONT_HERSHEY_SIMPLEX, 0.9, (0, 0, 255), 1)
        self.pub_msg.publish(target_array)
        self.pub_imgMsg(frame)
        return frame

if __name__ == "__main__":
    print("Python version: ", sys.version)
    capture = cv.VideoCapture(0)
    capture.set(6, cv.VideoWriter.fourcc('M', 'J', 'P', 'G'))
    capture.set(cv.CAP_PROP_FRAME_WIDTH, 640)
    capture.set(cv.CAP_PROP_FRAME_HEIGHT, 480)
    print("capture get FPS : ", capture.get(cv.CAP_PROP_FPS))
    detect = YoloDetect()
    while capture.isOpened():
        ret, frame = capture.read()
        action = cv.waitKey(1) & 0xFF
        frame = detect.detect(frame)
        if action == ord('q'): break
        if len(sys.argv) != 1:
            if sys.argv[1]=="true" or sys.argv[1]=="True": cv.imshow('frame', frame)
        else:cv.imshow('frame', frame)
    detect.cancel()
    capture.release()
    cv.destroyAllWindows()
