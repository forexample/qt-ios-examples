### CMakeLists.txt ---
##
## Author: Julien Wintz, Ruslan Baratov
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

include("cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.12.26.tar.gz"
    SHA1 "fb52c562bc5d8b48278cc2a84b0de682014adae5"
)
cmake_minimum_required(VERSION 3.0)

######################################################################

project(qt-ios-examples)

## #################################################################
## Dependencies - Qt
## #################################################################

hunter_add_package(Qt)
find_package(Qt5Widgets REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

## #################################################################
## Input
## #################################################################

add_subdirectory(analogclock)
add_subdirectory(hellogl2)
add_subdirectory(mouse-events)
add_subdirectory(stylesheets)
add_subdirectory(touch-events)
add_subdirectory(declarative-camera)
add_subdirectory(qml-custom-property-types)
