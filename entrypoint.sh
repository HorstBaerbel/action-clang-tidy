#!/bin/sh -l

# Terminate upon errors
set -e
# Run cmake
mkdir ${INPUT_SCANDIR}/${INPUT_BUILDDIR}
cmake -S ${INPUT_SCANDIR} -B ${INPUT_BUILDDIR}
# Run tidy script
python3 /run-clang-tidy.py ${INPUT_SCANDIR} ${INPUT_BUILDDIR} ${INPUT_EXCLUDEDIRS} ${INPUT_EXTENSIONS}