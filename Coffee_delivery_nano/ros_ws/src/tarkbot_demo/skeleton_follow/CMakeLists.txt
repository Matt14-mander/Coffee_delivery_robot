cmake_minimum_required(VERSION 2.8.3)
project(skeleton_follow)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  geometry_msgs
  message_generation
  image_transport
)


## Find catkin and any catkin packages

link_directories(lib lib/Plugins lib/Plugins/obt/3rdparty/lib lib/Plugins/openni)


## Declare ROS messages and services
add_message_files(
   FILES    
   astra_sdk_bodyattitude.msg
   astra_sdk_vector3f.msg
   astra_sdk_vector2f.msg
   astra_sdk_joint.msg
   astra_sdk_body.msg
   astra_sdk_bodynumber.msg
   astra_sdk_maskdata.msg
   astra_sdk_wight_hight.msg
   astra_sdk_rgb.msg
)


#add_service_files(FILES AddTwoInts.srv)

## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs)

## Declare a catkin package
catkin_package(
    CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)


add_executable(astra_sdk_demo src/astra_sdk_demo.cpp)
add_dependencies(astra_sdk_demo ${${PROJECT_NAME}_EXPORTED_TARGETS})
target_link_libraries(astra_sdk_demo ${catkin_LIBRARIES} astra astra_core astra_core_api)




