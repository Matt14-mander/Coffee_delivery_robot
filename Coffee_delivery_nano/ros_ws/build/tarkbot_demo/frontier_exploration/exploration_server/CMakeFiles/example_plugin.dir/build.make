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
include tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/depend.make

# Include the progress variables for this target.
include tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/progress.make

# Include the compile flags for this target's objects.
include tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/flags.make

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o: tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/flags.make
tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o: /home/xtark/tarkbot/ros_ws/src/tarkbot_demo/frontier_exploration/exploration_server/src/example_plugin.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xtark/tarkbot/ros_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_demo/frontier_exploration/exploration_server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o -c /home/xtark/tarkbot/ros_ws/src/tarkbot_demo/frontier_exploration/exploration_server/src/example_plugin.cpp

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_plugin.dir/src/example_plugin.cpp.i"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_demo/frontier_exploration/exploration_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xtark/tarkbot/ros_ws/src/tarkbot_demo/frontier_exploration/exploration_server/src/example_plugin.cpp > CMakeFiles/example_plugin.dir/src/example_plugin.cpp.i

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_plugin.dir/src/example_plugin.cpp.s"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_demo/frontier_exploration/exploration_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xtark/tarkbot/ros_ws/src/tarkbot_demo/frontier_exploration/exploration_server/src/example_plugin.cpp -o CMakeFiles/example_plugin.dir/src/example_plugin.cpp.s

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o.requires:

.PHONY : tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o.requires

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o.provides: tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o.requires
	$(MAKE) -f tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/build.make tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o.provides.build
.PHONY : tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o.provides

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o.provides.build: tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o


# Object files for target example_plugin
example_plugin_OBJECTS = \
"CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o"

# External object files for target example_plugin
example_plugin_EXTERNAL_OBJECTS =

/home/xtark/tarkbot/ros_ws/devel/lib/libexample_plugin.so: tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o
/home/xtark/tarkbot/ros_ws/devel/lib/libexample_plugin.so: tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/build.make
/home/xtark/tarkbot/ros_ws/devel/lib/libexample_plugin.so: tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xtark/tarkbot/ros_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/xtark/tarkbot/ros_ws/devel/lib/libexample_plugin.so"
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_demo/frontier_exploration/exploration_server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_plugin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/build: /home/xtark/tarkbot/ros_ws/devel/lib/libexample_plugin.so

.PHONY : tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/build

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/requires: tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/src/example_plugin.cpp.o.requires

.PHONY : tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/requires

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/clean:
	cd /home/xtark/tarkbot/ros_ws/build/tarkbot_demo/frontier_exploration/exploration_server && $(CMAKE_COMMAND) -P CMakeFiles/example_plugin.dir/cmake_clean.cmake
.PHONY : tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/clean

tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/depend:
	cd /home/xtark/tarkbot/ros_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xtark/tarkbot/ros_ws/src /home/xtark/tarkbot/ros_ws/src/tarkbot_demo/frontier_exploration/exploration_server /home/xtark/tarkbot/ros_ws/build /home/xtark/tarkbot/ros_ws/build/tarkbot_demo/frontier_exploration/exploration_server /home/xtark/tarkbot/ros_ws/build/tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tarkbot_demo/frontier_exploration/exploration_server/CMakeFiles/example_plugin.dir/depend

