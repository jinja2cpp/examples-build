rmdir /S /Q .build
rmdir /S /Q .jinja2cpp-build
rmdir /S /Q .jinja2cpp-install
rmdir /S /Q .rapidjson-build
rmdir /S /Q .rapidjson-install

mkdir .jinja2cpp-build
mkdir .jinja2cpp-install
mkdir .rapidjson-build
set CMAKE_PREFIX_PATH=../../../thirdparty/expected-lite;../../../thirdparty/variant-lite;../../../thirdparty/optional-lite;../../../thirdparty/string-view-lite;../../../thirdparty/fmt;../../../thirdparty/robin-hood-hashing/src;../.rapidjson-install;
cd .rapidjson-build
cmake ..\..\..\thirdparty\rapidjson -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=..\.rapidjson-install -DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DRAPIDJSON_BUILD_TESTS=OFF 
cmake --build . --config Release --target install
cd ..
cd .jinja2cpp-build
cmake ..\..\..\thirdparty\Jinja2Cpp -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=..\.jinja2cpp-install -DJINJA2CPP_BUILD_TESTS=OFF -DJINJA2CPP_DEPS_MODE=external
cmake --build . --config Release --target install
cd ..
mkdir .build
cd .build
cmake ..\ -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Release -Djinja2cpp_DIR=..\.jinja2cpp-install\lib\jinja2cpp
cmake --build . --config Release

cd ..
