# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/xtark/tarkbot/ros_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xtark/tarkbot/ros_ws/build

# Utility rule file for astra_camera_gencfg.

# Include the progress variables for this target.
include tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/progress.make

tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h
tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/AstraConfig.py
tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h
tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/UVCCameraConfig.py


/home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h: /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/ros_astra_camera/cfg/Astra.cfg
/home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h: /opt/ros/melodic/share/dynamic_reconfigure/templates/ConfigType.py.template
/home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h: /opt/ros/melodic/share/dynamic_reconfigure/templates/ConfigType.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/xtark/tarkbot/ros_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating dynamic reconfigure files from cfg/Astra.cfg: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/AstraConfig.py"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/ros_astra_camera && ../../../catkin_generated/env_cached.sh /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/ros_astra_camera/setup_custom_pythonpath.sh /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/ros_astra_camera/cfg/Astra.cfg /opt/ros/melodic/share/dynamic_reconfigure/cmake/.. /home/xtark/tarkbot/ros_ws/devel/share/astra_camera /home/xtark/tarkbot/ros_ws/devel/include/astra_camera /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera

/home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig.dox: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig.dox

/home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig-usage.dox: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig-usage.dox

/home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/AstraConfig.py: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/AstraConfig.py

/home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig.wikidoc: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig.wikidoc

/home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h: /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/ros_astra_camera/cfg/UVCCamera.cfg
/home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h: /opt/ros/melodic/share/dynamic_reconfigure/templates/ConfigType.py.template
/home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h: /opt/ros/melodic/share/dynamic_reconfigure/templates/ConfigType.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/xtark/tarkbot/ros_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating dynamic reconfigure files from cfg/UVCCamera.cfg: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/UVCCameraConfig.py"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/ros_astra_camera && ../../../catkin_generated/env_cached.sh /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/ros_astra_camera/setup_custom_pythonpath.sh /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/ros_astra_camera/cfg/UVCCamera.cfg /opt/ros/melodic/share/dynamic_reconfigure/cmake/.. /home/xtark/tarkbot/ros_ws/devel/share/astra_camera /home/xtark/tarkbot/ros_ws/devel/include/astra_camera /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera

/home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig.dox: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig.dox

/home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig-usage.dox: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig-usage.dox

/home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/UVCCameraConfig.py: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/UVCCameraConfig.py

/home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig.wikidoc: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig.wikidoc

astra_camera_gencfg: tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/AstraConfig.h
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig.dox
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig-usage.dox
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/AstraConfig.py
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/AstraConfig.wikidoc
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/include/astra_camera/UVCCameraConfig.h
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig.dox
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig-usage.dox
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/lib/python2.7/dist-packages/astra_camera/cfg/UVCCameraConfig.py
astra_camera_gencfg: /home/xtark/tarkbot/ros_ws/devel/share/astra_camera/docs/UVCCameraConfig.wikidoc
astra_camera_gencfg: tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/build.make

.PHONY : astra_camera_gencfg

# Rule to build all files generated by this target.
tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/build: astra_camera_gencfg

.PHONY : tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/build

tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/clean:
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/ros_astra_camera && $(CMAKE_COMMAND) -P CMakeFiles/astra_camera_gencfg.dir/cmake_clean.cmake
.PHONY : tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/clean

tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/depend:
	cd /home/xtark/tarkbot/ros_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xtark/tarkbot/ros_ws/src /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/ros_astra_camera /home/xtark/tarkbot/ros_ws/build /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/ros_astra_camera /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tarkbot_package/tarkbot_camera/ros_astra_camera/CMakeFiles/astra_camera_gencfg.dir/depend

