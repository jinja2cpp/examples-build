#!/bin/sh

SRC_DIR=`pwd`
mkdir -p .jinja2cpp-build && cd .jinja2cpp-build
echo $SRC_DIR
cmake ../../../thirdparty/Jinja2Cpp -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../.jinja2cpp-install -DJINJA2CPP_BUILD_TESTS=OFF -DJINJA2CPP_DEPS_MODE=external -DCMAKE_PREFIX_PATH="$SRC_DIR/../../thirdparty/expected-lite;$SRC_DIR/../../thirdparty/variant-lite;$SRC_DIR/../../thirdparty/optional-lite;$SRC_DIR/../../thirdparty/string-view-lite;$SRC_DIR/../../thirdparty/fmt;$SRC_DIR/../../thirdparty/robin-hood-hashing"
cmake --build . --target install
cd .. && mkdir -p .build && cd .build
cmake -DCMAKE_BUILD_TYPE=Release -Djinja2cpp_DIR=../.jinja2cpp-install/lib/jinja2cpp ..
cmake --build .