cmake_minimum_required (VERSION 3.0.0 FATAL_ERROR)
project (Jinja2CppBuildTest CXX)

include (../../cmake/conan.cmake)
if (NOT MSVC)
    set (CONAN_SETTINGS SETTINGS compiler.libcxx=libstdc++11)
endif ()

conan_cmake_run(REQUIRES 
                    gtest/1.7.0@bincrafters/stable
                BASIC_SETUP
                ${CONAN_SETTINGS}
                OPTIONS 
                    gtest:shared=False
                BUILD missing)
                
                
set (TARGET_NAME jinja2cpp_build_test)
set (CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/.jinja2cpp-install)

find_package(jinja2cpp REQUIRED)
find_package(Boost COMPONENTS system filesystem QUIET REQUIRED)

add_executable (${TARGET_NAME} main.cpp)

target_link_libraries (${TARGET_NAME} ${CONAN_LIBS} jinja2cpp)
set_target_properties (${TARGET_NAME} PROPERTIES
            CXX_STANDARD 14
            CXX_STANDARD_REQUIRED ON)

enable_testing()

add_test(NAME ${TARGET_NAME} COMMAND ${TARGET_NAME})