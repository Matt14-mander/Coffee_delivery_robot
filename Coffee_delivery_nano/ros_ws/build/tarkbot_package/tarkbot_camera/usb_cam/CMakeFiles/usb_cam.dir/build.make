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

# Include any dependencies generated for this target.
include tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/depend.make

# Include the progress variables for this target.
include tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/progress.make

# Include the compile flags for this target's objects.
include tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/flags.make

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o: tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/flags.make
tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o: /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/usb_cam/src/usb_cam.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xtark/tarkbot/ros_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/usb_cam && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o -c /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/usb_cam/src/usb_cam.cpp

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/usb_cam.dir/src/usb_cam.cpp.i"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/usb_cam && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/usb_cam/src/usb_cam.cpp > CMakeFiles/usb_cam.dir/src/usb_cam.cpp.i

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/usb_cam.dir/src/usb_cam.cpp.s"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/usb_cam && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/usb_cam/src/usb_cam.cpp -o CMakeFiles/usb_cam.dir/src/usb_cam.cpp.s

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o.requires:

.PHONY : tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o.requires

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o.provides: tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o.requires
	$(MAKE) -f tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/build.make tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o.provides.build
.PHONY : tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o.provides

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o.provides.build: tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o


# Object files for target usb_cam
usb_cam_OBJECTS = \
"CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o"

# External object files for target usb_cam
usb_cam_EXTERNAL_OBJECTS =

/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/build.make
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libimage_transport.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libmessage_filters.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libclass_loader.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/libPocoFoundation.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libdl.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libroslib.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/librospack.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libpython2.7.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libboost_program_options.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libtinyxml2.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libcamera_info_manager.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libcamera_calibration_parsers.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libroscpp.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/librosconsole.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libboost_regex.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/librostime.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /opt/ros/melodic/lib/libcpp_common.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so.0.4
/home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so: tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xtark/tarkbot/ros_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/usb_cam && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/usb_cam.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/build: /home/xtark/tarkbot/ros_ws/devel/lib/libusb_cam.so

.PHONY : tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/build

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/requires: tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/src/usb_cam.cpp.o.requires

.PHONY : tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/requires

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/clean:
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/usb_cam && $(CMAKE_COMMAND) -P CMakeFiles/usb_cam.dir/cmake_clean.cmake
.PHONY : tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/clean

tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/depend:
	cd /home/xtark/tarkbot/ros_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xtark/tarkbot/ros_ws/src /home/xtark/tarkbot/ros_ws/src/tarkbot_package/tarkbot_camera/usb_cam /home/xtark/tarkbot/ros_ws/build /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/usb_cam /home/xtark/tarkbot/ros_ws/build/tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tarkbot_package/tarkbot_camera/usb_cam/CMakeFiles/usb_cam.dir/depend

