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

add_executable(stylesheets MACOSX_BUNDLE main.mm main.qrc)
target_link_libraries(stylesheets Qt5::Widgets)
