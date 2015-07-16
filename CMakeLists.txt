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
