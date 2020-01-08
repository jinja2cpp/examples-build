rmdir /S /Q .build
rmdir /S /Q .rapidjson-build
rmdir /S /Q .rapidjson-install


mkdir .rapidjson-build
set CMAKE_PREFIX_PATH=../../../thirdparty/expected-lite;../../../thirdparty/variant-lite;../../../thirdparty/optional-lite;../../../thirdparty/string-view-lite;../../../thirdparty/fmt;../../../thirdparty/robin-hood-hashing/src;../.rapidjson-install;
cd .rapidjson-build
cmake ..\..\..\thirdparty\rapidjson -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=..\.rapidjson-install -DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DRAPIDJSON_BUILD_TESTS=OFF 
cmake --build . --config Release --target install
cd ..
mkdir .build 
cd .build
cmake .. -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
cd ..
