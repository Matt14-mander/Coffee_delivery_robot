# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "xtlidar_ros: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(xtlidar_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv" NAME_WE)
add_custom_target(_xtlidar_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xtlidar_ros" "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(xtlidar_ros
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xtlidar_ros
)

### Generating Module File
_generate_module_cpp(xtlidar_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xtlidar_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(xtlidar_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(xtlidar_ros_generate_messages xtlidar_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv" NAME_WE)
add_dependencies(xtlidar_ros_generate_messages_cpp _xtlidar_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xtlidar_ros_gencpp)
add_dependencies(xtlidar_ros_gencpp xtlidar_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xtlidar_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(xtlidar_ros
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xtlidar_ros
)

### Generating Module File
_generate_module_eus(xtlidar_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xtlidar_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(xtlidar_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(xtlidar_ros_generate_messages xtlidar_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv" NAME_WE)
add_dependencies(xtlidar_ros_generate_messages_eus _xtlidar_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xtlidar_ros_geneus)
add_dependencies(xtlidar_ros_geneus xtlidar_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xtlidar_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(xtlidar_ros
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xtlidar_ros
)

### Generating Module File
_generate_module_lisp(xtlidar_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xtlidar_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(xtlidar_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(xtlidar_ros_generate_messages xtlidar_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv" NAME_WE)
add_dependencies(xtlidar_ros_generate_messages_lisp _xtlidar_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xtlidar_ros_genlisp)
add_dependencies(xtlidar_ros_genlisp xtlidar_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xtlidar_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(xtlidar_ros
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xtlidar_ros
)

### Generating Module File
_generate_module_nodejs(xtlidar_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xtlidar_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(xtlidar_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(xtlidar_ros_generate_messages xtlidar_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv" NAME_WE)
add_dependencies(xtlidar_ros_generate_messages_nodejs _xtlidar_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xtlidar_ros_gennodejs)
add_dependencies(xtlidar_ros_gennodejs xtlidar_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xtlidar_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(xtlidar_ros
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xtlidar_ros
)

### Generating Module File
_generate_module_py(xtlidar_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xtlidar_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(xtlidar_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(xtlidar_ros_generate_messages xtlidar_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_lidar/xtlidar_ros/srv/Control.srv" NAME_WE)
add_dependencies(xtlidar_ros_generate_messages_py _xtlidar_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xtlidar_ros_genpy)
add_dependencies(xtlidar_ros_genpy xtlidar_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xtlidar_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xtlidar_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xtlidar_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(xtlidar_ros_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xtlidar_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xtlidar_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(xtlidar_ros_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xtlidar_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xtlidar_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(xtlidar_ros_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xtlidar_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xtlidar_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(xtlidar_ros_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xtlidar_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xtlidar_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xtlidar_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(xtlidar_ros_generate_messages_py geometry_msgs_generate_messages_py)
endif()
