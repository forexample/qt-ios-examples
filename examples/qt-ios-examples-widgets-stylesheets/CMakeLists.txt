### CMakeLists.txt ---
## 
## Author: Julien Wintz, Ruslan Baratov
## Created: Thu Mar  7 21:57:34 2013 (+0100)
## Version: 
## Last-Updated: Mon Mar 11 11:42:20 2013 (+0100)
##           By: Julien Wintz
##     Update #: 59
######################################################################
## 
### Change Log:
## 
######################################################################

project(qt-ios-examples-widgets-stylesheets)

add_executable(${PROJECT_NAME} MACOSX_BUNDLE main.mm main.qrc)
target_link_libraries(${PROJECT_NAME} Qt5::Widgets ${qt_ios_extra_libs})
