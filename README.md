# action-clang-tidy - A GitHub action to check a directory using clang-tidy

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Runs [clang-tidy](https://clang.llvm.org/extra/clang-tidy/) recursively on files in a directory. Can use a [.clang-tidy](https://clang.llvm.org/extra/clang-tidy/checks/list.html) file to specify the checks (example [.clang-tidy](.clang-tidy) file included).

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
      uses: HorstBaerbel/action-clang-tidy@1.0
      # These are optional (defaults displayed)
      with:
        scandir: '.'
        builddir: 'build'
        excludedirs: ''
        extensions: 'c,h,C,H,cpp,hpp,cc,hh,c++,h++,cxx,hxx'
```

## Parameters (optional), see action.yml

* **scandir**: Directory to scan, e.g. '/bla'.
* **builddir**: Directory to run build in, e.g. 'build'. Will automatically be excluded from the scan.
* **excludedirs**: Directories below scandir to exclude from scanning, e.g. "test,src/third_party".
* **extensions**: Extensions to include in scan, e.g. 'h,c,hpp,cpp'.
