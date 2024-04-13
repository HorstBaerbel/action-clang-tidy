#!/bin/bash

# Terminate upon errors
set -e

# Run cmake to configure
mkdir ${INPUT_SCANDIR}/${INPUT_BUILDDIR}
cd ${INPUT_SCANDIR}/${INPUT_BUILDDIR}
cmake ${INPUT_CMAKEOPTIONS} ..
cd ..

# Run tidy script
python3 /run-clang-tidy.py "${INPUT_SCANDIR}" "${INPUT_BUILDDIR}" "${INPUT_EXCLUDEDIRS}" "${INPUT_EXTENSIONS}"