### toolchain-ios-device.cmake ---
## 
## Author: Julien Wintz
## Created: Thu Mar  7 15:48:24 2013 (+0100)
## Version: 
## Last-Updated: Thu Mar  7 23:05:10 2013 (+0100)
##           By: Julien Wintz
##     Update #: 12
######################################################################
## 
### Change Log:
## 
######################################################################

set(CMAKE_SYSTEM_NAME Darwin)

find_program(CMAKE_C_COMPILER NAME gcc
  PATHS
  /Applications/XCode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/
  /Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/
  NO_DEFAULT_PATH)

find_program(CMAKE_CXX_COMPILER NAME g++
  PATHS
  /Applications/XCode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/
  /Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/
  NO_DEFAULT_PATH)

set(CMAKE_OSX_ARCHITECTURES armv7)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D__IPHONE_OS_VERSION_MIN_REQUIRED=40300")

set(CMAKE_OSX_SYSROOT)
set(possible_sdk_roots
  /Applications/XCode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs
  /Developer/Platforms/iPhoneOS.platform/Developer/SDKs
  )
foreach(sdk_root ${possible_sdk_roots})
  foreach(sdk iPhoneOS6.0.sdk iPhoneOS6.1.sdk)
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
set(MACOSX_BUNDLE_GUI_IDENTIFIER CACHE STRING "fr.inria.sophia.\${PRODUCT_NAME:identifier}")

set(CMAKE_FIND_ROOT_PATH ${CMAKE_OSX_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

add_definitions(-DQ_OS_IOS_DEVICE)

set(IOS 1)
set(IOS_DEVICE 1)
