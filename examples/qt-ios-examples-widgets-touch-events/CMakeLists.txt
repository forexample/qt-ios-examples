### CMakeLists.txt ---
## 
## Author: Julien Wintz
## Created: Thu Mar  7 21:57:34 2013 (+0100)
## Version: 
## Last-Updated: Fri Mar  8 11:11:07 2013 (+0100)
##           By: Julien Wintz
##     Update #: 48
######################################################################
## 
### Change Log:
## 
######################################################################

project(qt-ios-examples-widgets-touch-events)

## ###################################################################
## Desktop build
## ###################################################################

if(NOT IOS-DEVICE AND NOT IOS-SIMULATOR)

add_executable(${PROJECT_NAME} MACOSX_BUNDLE main.mm)

qt5_use_modules(${PROJECT_NAME} Core)
qt5_use_modules(${PROJECT_NAME} Gui)
qt5_use_modules(${PROJECT_NAME} Widgets)

target_link_libraries(${PROJECT_NAME} "-framework Cocoa")

endif()

## ###################################################################
## Simulator build
## ###################################################################

if(IOS-SIMULATOR)

execute_process(COMMAND qmake-ios-simulator ${CMAKE_CURRENT_SOURCE_DIR} WORKING_DIRECTORY ${CMAKE_BINARY_DIR})

endif()

## ###################################################################
## Device build
## ###################################################################

if(IOS-DEVICE)

execute_process(COMMAND qmake-ios-device ${CMAKE_CURRENT_SOURCE_DIR} WORKING_DIRECTORY ${CMAKE_BINARY_DIR})

endif()
