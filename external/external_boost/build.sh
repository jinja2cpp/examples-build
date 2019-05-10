#!/bin/sh

mkdir .jinja2cpp-build && cd .jinja2cpp-build
cmake ../../../thirdparty/Jinja2Cpp -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../.jinja2cpp-install -DJINJA2CPP_BUILD_TESTS=OFF -DJINJA2CPP_DEPS_MODE=external-boost
cmake --build . --target install
cd .. && mkdir .build && cd .build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .