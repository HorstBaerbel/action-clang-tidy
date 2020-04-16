#!/bin/bash

# Terminate upon errors
set -e
# Run cmake to configure
# does not work -> CMake Error: The source directory "/github/workspace/build" does not appear to contain CMakeLists.txt.
#mkdir ${INPUT_BUILDDIR}
#cd ${INPUT_BUILDDIR}
#cmake ${INPUT_SCANDIR}
# does not work either
cmake -S ${INPUT_SCANDIR} -B ${INPUT_SCANDIR}/${INPUT_BUILDDIR}
# Run tidy script
python3 /run-clang-tidy.py ${INPUT_SCANDIR} ${INPUT_BUILDDIR} ${INPUT_EXCLUDEDIRS} ${INPUT_EXTENSIONS}