#!/bin/sh

mkdir .build && cd .build
conan install  --build=missing -s compiler.libcxx=libstdc++11 ..
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .