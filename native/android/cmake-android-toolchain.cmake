# Chainload the NDK's supported CMake toolchain for upstream CMake subprojects.
# Meson's generated compiler entries alone make CMake default Android to API 21.
if(NOT DEFINED ANDROID_NDK)
    if(DEFINED ENV{ANDROID_NDK_HOME})
        set(ANDROID_NDK "$ENV{ANDROID_NDK_HOME}")
    elseif(DEFINED ENV{ANDROID_NDK_ROOT})
        set(ANDROID_NDK "$ENV{ANDROID_NDK_ROOT}")
    else()
        message(FATAL_ERROR "Set ANDROID_NDK_HOME to the installed Android NDK")
    endif()
endif()

set(ANDROID_ABI arm64-v8a CACHE STRING "Android ABI" FORCE)
set(ANDROID_NATIVE_API_LEVEL 33 CACHE STRING "Android native API" FORCE)
set(ANDROID_PLATFORM android-33 CACHE STRING "Android platform" FORCE)
include("${ANDROID_NDK}/build/cmake/android.toolchain.cmake")
