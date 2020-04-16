#!/bin/bash

# Terminate upon errors
set -e
# Run cmake
mkdir ${INPUT_SCANDIR}/${INPUT_BUILDDIR}
pwd
ls
cmake -S ${INPUT_SCANDIR} -B ${INPUT_SCANDIR}/${INPUT_BUILDDIR}
# Run tidy script
python3 /run-clang-tidy.py ${INPUT_SCANDIR} ${INPUT_BUILDDIR} ${INPUT_EXCLUDEDIRS} ${INPUT_EXTENSIONS}