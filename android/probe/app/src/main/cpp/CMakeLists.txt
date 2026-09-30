cmake_minimum_required(VERSION 3.22.1)
project(boxdroid_m0_probe LANGUAGES CXX)

add_library(boxdroid_m0 SHARED native_probe.cpp)
target_compile_features(boxdroid_m0 PRIVATE cxx_std_17)
target_compile_options(boxdroid_m0 PRIVATE -Wall -Wextra -Werror=return-type)
target_link_libraries(boxdroid_m0 PRIVATE vulkan android log)
