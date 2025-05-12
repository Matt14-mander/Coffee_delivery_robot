#!/bin/bash

echo "remap the device serial port(ttyUSBX) to  lidar"
echo "lidar usb connection as /dev/xtark_lidar , check it using the command : ls -l /dev|grep ttyUSB"
echo "start copy tarkbot_lidar.rules to  /etc/udev/rules.d/"

echo  'KERNEL=="ttyCH341USB*", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE:="0777", SYMLINK+="tarkbot_lidar"' >/etc/udev/rules.d/tarkbot_lidar.rules

echo " "
echo "Restarting udev"
echo ""
sudo service udev reload
sleep 2
sudo service udev restart
echo "finish "
