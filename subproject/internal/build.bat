rmdir /S /Q .build
mkdir .build
cd .build
cmake .. -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
cd ..
