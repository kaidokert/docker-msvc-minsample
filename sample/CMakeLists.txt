cmake_minimum_required(VERSION 3.10)

project(myproject)
add_executable(myproject main.cpp)
target_compile_definitions(myproject PRIVATE -DBUILD_DRIVER="CMake")