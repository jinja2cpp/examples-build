cmake_minimum_required (VERSION 3.0.0 FATAL_ERROR)
project (Jinja2CppBuildTest CXX)

include (../../cmake/conan.cmake)
if (NOT MSVC)
    set (CONAN_SETTINGS SETTINGS compiler.libcxx=libstdc++11)
endif ()

set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_BINARY_DIR})
                
set (TARGET_NAME jinja2cpp_build_test)

set (JINJA2CPP_DEPS_MODE conan-build)

find_package(gtest)
set (JINJA2CPP_DEPS_MODE conan-build CACHE STRING "" FORCE)

add_subdirectory (../../thirdparty/Jinja2Cpp ${CMAKE_CURRENT_BINARY_DIR}/thirdparty/jinja2cpp)

add_executable (${TARGET_NAME} main.cpp)

target_link_libraries (${TARGET_NAME} GTest::GTest jinja2cpp)
set_target_properties (${TARGET_NAME} PROPERTIES
            CXX_STANDARD 14
            CXX_STANDARD_REQUIRED ON)

enable_testing()

add_test(NAME ${TARGET_NAME} COMMAND ${TARGET_NAME})