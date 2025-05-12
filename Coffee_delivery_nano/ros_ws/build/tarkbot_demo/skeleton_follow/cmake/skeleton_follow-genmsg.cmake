# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "skeleton_follow: 9 messages, 0 services")

set(MSG_I_FLAGS "-Iskeleton_follow:/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(skeleton_follow_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg" ""
)

get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg" "skeleton_follow/astra_sdk_vector2f:skeleton_follow/astra_sdk_vector3f"
)

get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg" "skeleton_follow/astra_sdk_vector2f:skeleton_follow/astra_sdk_joint:skeleton_follow/astra_sdk_vector3f:skeleton_follow/astra_sdk_body"
)

get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg" "skeleton_follow/astra_sdk_vector2f:skeleton_follow/astra_sdk_joint:skeleton_follow/astra_sdk_vector3f"
)

get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg" ""
)

get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg" ""
)

get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg" ""
)

get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg" ""
)

get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg" NAME_WE)
add_custom_target(_skeleton_follow_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "skeleton_follow" "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_cpp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
)

### Generating Services

### Generating Module File
_generate_module_cpp(skeleton_follow
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(skeleton_follow_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(skeleton_follow_generate_messages skeleton_follow_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_cpp _skeleton_follow_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(skeleton_follow_gencpp)
add_dependencies(skeleton_follow_gencpp skeleton_follow_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS skeleton_follow_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)
_generate_msg_eus(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
)

### Generating Services

### Generating Module File
_generate_module_eus(skeleton_follow
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(skeleton_follow_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(skeleton_follow_generate_messages skeleton_follow_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_eus _skeleton_follow_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(skeleton_follow_geneus)
add_dependencies(skeleton_follow_geneus skeleton_follow_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS skeleton_follow_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)
_generate_msg_lisp(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
)

### Generating Services

### Generating Module File
_generate_module_lisp(skeleton_follow
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(skeleton_follow_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(skeleton_follow_generate_messages skeleton_follow_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_lisp _skeleton_follow_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(skeleton_follow_genlisp)
add_dependencies(skeleton_follow_genlisp skeleton_follow_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS skeleton_follow_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)
_generate_msg_nodejs(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
)

### Generating Services

### Generating Module File
_generate_module_nodejs(skeleton_follow
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(skeleton_follow_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(skeleton_follow_generate_messages skeleton_follow_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_nodejs _skeleton_follow_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(skeleton_follow_gennodejs)
add_dependencies(skeleton_follow_gennodejs skeleton_follow_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS skeleton_follow_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg"
  "${MSG_I_FLAGS}"
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg;/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)
_generate_msg_py(skeleton_follow
  "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
)

### Generating Services

### Generating Module File
_generate_module_py(skeleton_follow
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(skeleton_follow_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(skeleton_follow_generate_messages skeleton_follow_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodyattitude.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_joint.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_bodynumber.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_body.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_wight_hight.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_maskdata.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector3f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_vector2f.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xtark/tarkbot/ros_ws/src/tarkbot_demo/skeleton_follow/msg/astra_sdk_rgb.msg" NAME_WE)
add_dependencies(skeleton_follow_generate_messages_py _skeleton_follow_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(skeleton_follow_genpy)
add_dependencies(skeleton_follow_genpy skeleton_follow_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS skeleton_follow_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/skeleton_follow
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(skeleton_follow_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/skeleton_follow
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(skeleton_follow_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/skeleton_follow
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(skeleton_follow_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/skeleton_follow
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(skeleton_follow_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/skeleton_follow
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(skeleton_follow_generate_messages_py std_msgs_generate_messages_py)
endif()
