# 塔克R20系列机器人-ROS开发指南

## 版本记录
  - V2.2.20230621
  - 机器人默认开机为AP模式，Wi-Fi：TARKBOT-WIFI 密码：66668888  
  - 机器人计算机名称改为 xtark@tarkbot，密码还是xtark  
  - 功能包由xtark改写为tarkbot  
  - 多雷达支持，添加lb1l雷达，40m测量距离，30Hz运行频率，性能强劲
  - 去掉舵机校准功能，舵机校准功能移植到Open_CTR端
  - 灯光设置，增加灯光效果保存选项，详见ROS机器人基础教程
  - 增加机器人校准功能包tarkbot_calibrate
  - 机器人端增加方向盘控制支持
  - 发送机器人型号信息，用于底盘类型是否正确，不正确蜂鸣器会鸣叫
  - 新安装Teamview远程软件，启动方式终端输入teamviewer,需在VNC下运行
  - 添加yolov5识别功能（需使用GPU，当前仅nano支持）
  - 添加多机编队功能
  - 添加自动驾驶功能（需使用GPU，当前仅nano支持）
  - 添加mediapipe功能（需使用GPU，当前仅nano支持）