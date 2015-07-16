### CMakeLists.txt ---
##
## Author: Julien Wintz
## Created: Thu Mar  7 21:48:43 2013 (+0100)
## Version:
## Last-Updated: Fri Mar  8 00:30:56 2013 (+0100)
##           By: Julien Wintz
##     Update #: 16
######################################################################
##
### Change Log:
##
######################################################################

cmake_minimum_required(VERSION 3.0)

######################################################################

project(qt-ios-examples)

## ###################################################################
##
## ###################################################################

option(IOS-DEVICE    "iOS device    build" OFF)
option(IOS-SIMULATOR "iOS simulator build" OFF)

if(IOS-DEVICE)
  add_definitions("-DQ_OS_IOS")
  add_definitions("-DQ_OS_IOS_DEVICE")
endif(IOS-DEVICE)

if(IOS-SIMULATOR)
  add_definitions("-DQ_OS_IOS")
  add_definitions("-DQ_OS_IOS_SIMULATOR")
endif(IOS-SIMULATOR)

## #################################################################
##
## #################################################################

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

## #################################################################
##
## #################################################################

mark_as_advanced(CMAKE_BUILD_TYPE)
mark_as_advanced(CMAKE_INSTALL_PREFIX)
mark_as_advanced(CMAKE_OSX_ARCHITECTURES)
mark_as_advanced(CMAKE_OSX_DEPLOYMENT_TARGET)
mark_as_advanced(CMAKE_OSX_SYSROOT)

## #################################################################
## Dependencies - Qt
## #################################################################

find_package(Qt5Concurrent REQUIRED)
find_package(Qt5Core       REQUIRED)
find_package(Qt5Gui        REQUIRED)
find_package(Qt5Quick      REQUIRED)
find_package(Qt5Widgets    REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

## #################################################################
## Input
## #################################################################

add_subdirectory(examples)
