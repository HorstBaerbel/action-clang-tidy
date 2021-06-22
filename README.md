# action-clang-tidy - A GitHub action to check a directory using clang-tidy

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Runs [clang-tidy](https://clang.llvm.org/extra/clang-tidy/) recursively on files in a directory. Can use a [.clang-tidy](https://clang.llvm.org/extra/clang-tidy/checks/list.html) file to specify the checks (example [.clang-tidy](.clang-tidy) file included). It gets its file paths and includes from CMake build files, thus it needs to run a successful CMake configure, which in turn means you need a working CMakeLists.txt file.

If you find a bug or make an improvement your pull requests are appreciated.

## License

All of this is under the [MIT License](LICENSE).

## Usage

Create a new workflow file, e.g. ./github/workflows/clang-tidy.yml:

```yaml
# Run clang-tidy
name: Clang-tidy

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  checkout-and-check-formatting:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Run clang-tidy
      uses: HorstBaerbel/action-clang-tidy@1.2
      # These are optional (defaults displayed)
      with:
        scandir: '.'
        builddir: 'build'
        excludedirs: ''
        extensions: 'c,h,C,H,cpp,hpp,cc,hh,c++,h++,cxx,hxx'
        cmakeoptions: ''
```

## Parameters (optional), see action.yml

* **scandir**: Directory to scan, e.g. 'src'. MUST be realtive to you repository, thus '.' means root of repository. MUST contain a valid CMakeLists.txt.
* **builddir**: Directory to run CMake build in, e.g. 'build'. Will automatically be excluded from the scan. MUST be relative to scandir, thus 'build' means 'scandir/build'.
* **excludedirs**: Directories below scandir to exclude from scanning, e.g. "test,src/third_party".
* **extensions**: Extensions to include in scan, e.g. 'h,c,hpp,cpp'.
* **cmakeoptions**: Pass an additional option string to cmake (will call cmake cmakeoptions scandir).
