#!/bin/bash

# Terminate upon errors
set -e
# Run cmake to configure
mkdir ${INPUT_BUILDDIR}
cd ${INPUT_BUILDDIR}
cmake ${INPUT_SCANDIR}
# Run tidy script
python3 /run-clang-tidy.py ${INPUT_SCANDIR} ${INPUT_BUILDDIR} ${INPUT_EXCLUDEDIRS} ${INPUT_EXTENSIONS}