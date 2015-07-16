### CMakeLists.txt ---
##
## Author: Julien Wintz, Ruslan Baratov
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

add_executable(${PROJECT_NAME} MACOSX_BUNDLE main.mm)
target_link_libraries(${PROJECT_NAME} Qt5::Widgets ${qt_ios_extra_libs})
