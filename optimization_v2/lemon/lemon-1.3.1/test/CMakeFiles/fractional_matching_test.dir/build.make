# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1

# Include any dependencies generated for this target.
include test/CMakeFiles/fractional_matching_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/fractional_matching_test.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/fractional_matching_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/fractional_matching_test.dir/flags.make

test/CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o: test/CMakeFiles/fractional_matching_test.dir/flags.make
test/CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o: test/fractional_matching_test.cc
test/CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o: test/CMakeFiles/fractional_matching_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o"
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o -MF CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o.d -o CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o -c /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test/fractional_matching_test.cc

test/CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.i"
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test/fractional_matching_test.cc > CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.i

test/CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.s"
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test/fractional_matching_test.cc -o CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.s

# Object files for target fractional_matching_test
fractional_matching_test_OBJECTS = \
"CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o"

# External object files for target fractional_matching_test
fractional_matching_test_EXTERNAL_OBJECTS =

test/fractional_matching_test: test/CMakeFiles/fractional_matching_test.dir/fractional_matching_test.cc.o
test/fractional_matching_test: test/CMakeFiles/fractional_matching_test.dir/build.make
test/fractional_matching_test: lemon/libemon.a
test/fractional_matching_test: test/CMakeFiles/fractional_matching_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable fractional_matching_test"
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fractional_matching_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/fractional_matching_test.dir/build: test/fractional_matching_test
.PHONY : test/CMakeFiles/fractional_matching_test.dir/build

test/CMakeFiles/fractional_matching_test.dir/clean:
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test && $(CMAKE_COMMAND) -P CMakeFiles/fractional_matching_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/fractional_matching_test.dir/clean

test/CMakeFiles/fractional_matching_test.dir/depend:
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1 /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1 /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/test/CMakeFiles/fractional_matching_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/fractional_matching_test.dir/depend

