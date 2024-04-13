FROM horstbaerbel/ccpp-cmake-build-and-test:1.1

LABEL "com.github.actions.name"="action-clang-tidy"
LABEL "com.github.actions.description"="Run clang-tidy on source directory"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.1.0"
LABEL repository="https://github.com/HorstBaerbel/action-clang-tidy"
LABEL homepage="https://github.com/HorstBaerbel/action-clang-tidy"
LABEL maintainer="Bim Overbohm <bim.overbohm@googlemail.com>"

COPY run-clang-tidy.py /run-clang-tidy.py
RUN chmod +x /run-clang-tidy.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
