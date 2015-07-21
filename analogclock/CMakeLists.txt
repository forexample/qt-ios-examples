# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

add_executable(
    analogclock
    MACOSX_BUNDLE
    analogclock.cpp
    analogclock.h
    main.cpp
)

target_link_libraries(analogclock Qt5::Widgets)
