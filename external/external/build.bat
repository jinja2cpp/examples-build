mkdir .jinja2cpp-build
mkdir .jinja2cpp-install
cd .jinja2cpp-build
set CMAKE_PREFIX_PATH=../../../thirdparty/expected-lite;../../../thirdparty/variant-lite;../../../thirdparty/optional-lite;../../../thirdparty/string-view-lite;../../../thirdparty/fmt
cmake ..\..\..\thirdparty\Jinja2Cpp -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=..\.jinja2cpp-install -DJINJA2CPP_BUILD_TESTS=OFF -DJINJA2CPP_DEPS_MODE=external
cmake --build . --config Release --target install
cd ..
mkdir .build
cd .build
cmake ..\ -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Release -Djinja2cpp_DIR=..\.jinja2cpp-install\lib\jinja2cpp
cmake --build . --config Release

