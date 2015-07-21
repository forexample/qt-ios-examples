### CMakeLists.txt ---
##
## Author: Julien Wintz, Ruslan Baratov
## Created: Thu Mar  7 21:57:34 2013 (+0100)
## Version:
## Last-Updated: Fri Mar  8 11:11:18 2013 (+0100)
##           By: Julien Wintz
##     Update #: 44
######################################################################
##
### Change Log:
##
######################################################################

add_executable(mouse_events MACOSX_BUNDLE main.mm)
target_link_libraries(mouse_events Qt5::Widgets)
