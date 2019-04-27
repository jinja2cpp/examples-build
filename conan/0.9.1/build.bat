mkdir -p build && cd build
cmake ..\%EXAMPLE_PATH% -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=%configuration%
cmake --build . --config Release
