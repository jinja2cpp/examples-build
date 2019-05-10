#!/bin/sh

set SRC_DIR=`pwd`
mkdir .jinja2cpp-build && cd .jinja2cpp-build
#set CMAKE_PREFIX_PATH=../../../thirdparty/expected-lite;../../../thirdparty/variant-lite;../../../thirdparty/optional-lite;../../../thirdparty/value-ptr-lite
cmake ../../../thirdparty/Jinja2Cpp -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../.jinja2cpp-install -DJINJA2CPP_BUILD_TESTS=OFF -DJINJA2CPP_DEPS_MODE=external -DCMAKE_PREFIX_PATH="${SRC_DIR}/../../thirdparty/expected-lite;${SRC_DIR}/../../thirdparty/variant-lite;${SRC_DIR}/../../thirdparty/optional-lite;${SRC_DIR}/../../thirdparty/value-ptr-lite"
cmake --build . --target install
cd .. && mkdir .build && cd .build
cmake -DCMAKE_BUILD_TYPE=Release -Djinja2cpp_DIR=../.jinja2cpp-install/lib/jinja2cpp ..
cmake --build .