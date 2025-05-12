# Install script for directory: /home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/xtark/tarkbot/ros_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/skeleton_follow/msg" TYPE FILE FILES
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg"
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg"
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg"
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg"
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg"
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg"
    "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/skeleton_follow/cmake" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/skeleton_follow/catkin_generated/installspace/skeleton_follow-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/include/skeleton_follow")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/share/roseus/ros/skeleton_follow")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/share/common-lisp/ros/skeleton_follow")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/share/gennodejs/ros/skeleton_follow")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/skeleton_follow")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/skeleton_follow")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/skeleton_follow/catkin_generated/installspace/skeleton_follow.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/skeleton_follow/cmake" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/skeleton_follow/catkin_generated/installspace/skeleton_follow-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/skeleton_follow/cmake" TYPE FILE FILES
    "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/skeleton_follow/catkin_generated/installspace/skeleton_followConfig.cmake"
    "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/skeleton_follow/catkin_generated/installspace/skeleton_followConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/skeleton_follow" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/package.xml")
endif()

