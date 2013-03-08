### toolchain-ios-simulator.cmake ---
## 
## Author: Julien Wintz
## Created: Thu Mar  7 15:48:34 2013 (+0100)
## Version: 
## Last-Updated: Thu Mar  7 23:39:26 2013 (+0100)
##           By: Julien Wintz
##     Update #: 32
######################################################################
## 
### Change Log:
## 
######################################################################

set(CMAKE_SYSTEM_NAME Darwin)

find_program(CMAKE_C_COMPILER NAME gcc
  PATHS
  /Applications/XCode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/
  /Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/
  NO_DEFAULT_PATH)

find_program(CMAKE_CXX_COMPILER NAME g++
  PATHS
  /Applications/XCode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/
  /Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/
  NO_DEFAULT_PATH)

set(CMAKE_OSX_ARCHITECTURES i386)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden")

set(CMAKE_OSX_SYSROOT)
set(possible_sdk_roots
  /Applications/XCode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs
  /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs)
foreach(sdk_root ${possible_sdk_roots})
  foreach(sdk iPhoneSimulator6.0.sdk iPhoneSimulator6.1.sdk)
    if (EXISTS ${sdk_root}/${sdk} AND IS_DIRECTORY ${sdk_root}/${sdk})
      set(CMAKE_OSX_SYSROOT ${sdk_root}/${sdk})
    endif()
  endforeach()
endforeach()
if (NOT CMAKE_OSX_SYSROOT)
  message(FATAL_ERROR "Could not find a usable iOS SDK in ${sdk_root}")
endif()
message(STATUS "-- Using iOS SDK: ${CMAKE_OSX_SYSROOT}")

set(CMAKE_OSX_ARCHITECTURES "${CMAKE_OSX_ARCHITECTURES}" CACHE STRING "osx architectures")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" CACHE STRING "c++ flags")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "c flags")
set(CMAKE_OSX_SYSROOT "${CMAKE_OSX_SYSROOT}" CACHE PATH "OSX sysroot")

set(CMAKE_FIND_ROOT_PATH ${CMAKE_OSX_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

add_definitions(-DQ_OS_IOS_SIMULATOR)

set(IOS 1)
set(IOS_SIMULATOR 1)
