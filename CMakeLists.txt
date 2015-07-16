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
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(qt_lib_dir "${Qt5Core_DIR}/../..")
set(
    qt_ios_extra_libs
    # Frameworks
    "-framework UIKit"
    "-framework AssetsLibrary"
    "-framework OpenGLES"
    "-framework Foundation"
    "-framework QuartzCore"
    "-framework CoreFoundation"
    "-framework CoreText"
    "-framework CoreGraphics"
    # Qt
    Qt5::QIOSIntegrationPlugin
    # Qt non-imported
    "${qt_lib_dir}/libqtharfbuzzng$<$<CONFIG:Debug>:_debug>.a"
    "${qt_lib_dir}/libqtpcre$<$<CONFIG:Debug>:_debug>.a"
    "${qt_lib_dir}/libQt5PlatformSupport$<$<CONFIG:Debug>:_debug>.a"
    # 3rdParty
    z # TODO: link Hunter version
    # linker flags
    "-all_load"
)

## #################################################################
## Input
## #################################################################

add_subdirectory(hellogl2)
add_subdirectory(mouse-events)
add_subdirectory(stylesheets)
add_subdirectory(touch-events)
