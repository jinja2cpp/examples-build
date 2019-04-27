#!/bin/sh

mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ../${EXAMPLE_PATH}
cmake --build .
  - ctest . -C Release -V