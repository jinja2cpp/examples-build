#!/bin/sh

SRC_DIR=`pwd`
mkdir -p .rapidjson-build && cd .rapidjson-build
echo $SRC_DIR
cmake ../../../thirdparty/rapidjson -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../.rapidjson-install  -DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DRAPIDJSON_BUILD_TESTS=OFF
cmake --build . --target install
cd .. && mkdir -p .build && cd .build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .