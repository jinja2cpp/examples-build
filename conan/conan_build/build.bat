rmdir /S /Q .build

mkdir .build
cd .build
conan install --build=missing ..  

cmake .. -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=%configuration%
cmake --build . --config Release

cd ..
