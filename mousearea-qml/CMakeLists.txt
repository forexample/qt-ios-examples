# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

add_executable(
    mousearea-qml
    MACOSX_BUNDLE
    main.cpp
    mousearea.qml
    mousearea.qrc
)

find_package(Qt5Qml REQUIRED)
find_package(Qt5Quick REQUIRED)

target_link_libraries(mousearea-qml Qt5::Core Qt5::Gui Qt5::Qml Qt5::Quick)
