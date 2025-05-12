# Install script for directory: /home/xtark/tarkbot/ros_ws/src/tarkbot_demo/tarkbot_topic_service_action_learing/move_action

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/move_action/action" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/tarkbot_topic_service_action_learing/move_action/action/Move_Action.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/move_action/msg" TYPE FILE FILES
    "/home/xtark/tarkbot/ros_ws/devel/share/move_action/msg/Move_ActionAction.msg"
    "/home/xtark/tarkbot/ros_ws/devel/share/move_action/msg/Move_ActionActionGoal.msg"
    "/home/xtark/tarkbot/ros_ws/devel/share/move_action/msg/Move_ActionActionResult.msg"
    "/home/xtark/tarkbot/ros_ws/devel/share/move_action/msg/Move_ActionActionFeedback.msg"
    "/home/xtark/tarkbot/ros_ws/devel/share/move_action/msg/Move_ActionGoal.msg"
    "/home/xtark/tarkbot/ros_ws/devel/share/move_action/msg/Move_ActionResult.msg"
    "/home/xtark/tarkbot/ros_ws/devel/share/move_action/msg/Move_ActionFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/move_action/cmake" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/tarkbot_topic_service_action_learing/move_action/catkin_generated/installspace/move_action-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/include/move_action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/share/roseus/ros/move_action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/share/common-lisp/ros/move_action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/share/gennodejs/ros/move_action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/move_action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/move_action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/tarkbot_topic_service_action_learing/move_action/catkin_generated/installspace/move_action.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/move_action/cmake" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/tarkbot_topic_service_action_learing/move_action/catkin_generated/installspace/move_action-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/move_action/cmake" TYPE FILE FILES
    "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/tarkbot_topic_service_action_learing/move_action/catkin_generated/installspace/move_actionConfig.cmake"
    "/home/xtark/tarkbot/ros_ws/build/tarkbot_demo/tarkbot_topic_service_action_learing/move_action/catkin_generated/installspace/move_actionConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/move_action" TYPE FILE FILES "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/tarkbot_topic_service_action_learing/move_action/package.xml")
endif()

