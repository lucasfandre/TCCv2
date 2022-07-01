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
include tools/CMakeFiles/dimacs-solver.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tools/CMakeFiles/dimacs-solver.dir/compiler_depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/dimacs-solver.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/dimacs-solver.dir/flags.make

tools/CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o: tools/CMakeFiles/dimacs-solver.dir/flags.make
tools/CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o: tools/dimacs-solver.cc
tools/CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o: tools/CMakeFiles/dimacs-solver.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o"
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tools/CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o -MF CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o.d -o CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o -c /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools/dimacs-solver.cc

tools/CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.i"
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools/dimacs-solver.cc > CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.i

tools/CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.s"
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools/dimacs-solver.cc -o CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.s

# Object files for target dimacs-solver
dimacs__solver_OBJECTS = \
"CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o"

# External object files for target dimacs-solver
dimacs__solver_EXTERNAL_OBJECTS =

tools/dimacs-solver: tools/CMakeFiles/dimacs-solver.dir/dimacs-solver.cc.o
tools/dimacs-solver: tools/CMakeFiles/dimacs-solver.dir/build.make
tools/dimacs-solver: lemon/libemon.a
tools/dimacs-solver: tools/CMakeFiles/dimacs-solver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable dimacs-solver"
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dimacs-solver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/dimacs-solver.dir/build: tools/dimacs-solver
.PHONY : tools/CMakeFiles/dimacs-solver.dir/build

tools/CMakeFiles/dimacs-solver.dir/clean:
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools && $(CMAKE_COMMAND) -P CMakeFiles/dimacs-solver.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/dimacs-solver.dir/clean

tools/CMakeFiles/dimacs-solver.dir/depend:
	cd /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1 /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1 /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools /home/lucas/Documents/TCC/optimization_v2/lemon/lemon-1.3.1/tools/CMakeFiles/dimacs-solver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/CMakeFiles/dimacs-solver.dir/depend

