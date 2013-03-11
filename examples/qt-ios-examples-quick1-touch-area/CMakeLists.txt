### CMakeLists.txt ---
## 
## Author: Julien Wintz
## Created: Thu Mar  7 21:57:34 2013 (+0100)
## Version: 
## Last-Updated: Mon Mar 11 15:43:21 2013 (+0100)
##           By: Julien Wintz
##     Update #: 53
######################################################################
## 
### Change Log:
## 
######################################################################

project(qt-ios-examples-quick1-touch-area)

## ###################################################################
## Desktop build
## ###################################################################

if(NOT IOS-DEVICE AND NOT IOS-SIMULATOR)

set(${PROJECT_NAME}_SOURCES
  main.mm)

set(${PROJECT_NAME}_SOURCES_QRC
  main.qrc)

qt5_add_resources(${PROJECT_NAME}_SOURCES_RCC ${${PROJECT_NAME}_SOURCES_QRC})

add_executable(${PROJECT_NAME} MACOSX_BUNDLE
  ${${PROJECT_NAME}_SOURCES}
  ${${PROJECT_NAME}_SOURCES_RCC})

qt5_use_modules(${PROJECT_NAME} Core)
qt5_use_modules(${PROJECT_NAME} Gui)
qt5_use_modules(${PROJECT_NAME} Declarative)

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
