# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

hunter_add_package(Qt COMPONENTS qtdeclarative) # Qt5Quick
find_package(Qt5Quick REQUIRED) # Qt5::Quick
find_package(Qt5Gui REQUIRED) # Qt5::Gui
find_package(Qt5Widgets REQUIRED) # Qt5::Widgets

set(qt_conf "${CMAKE_CURRENT_LIST_DIR}/qt.conf")
set(qml_dir "${CMAKE_CURRENT_BINARY_DIR}/qt_qml")

hunter_add_package(QtQmlManager)
list(APPEND CMAKE_MODULE_PATH "${QTQMLMANAGER_ROOT}/cmake")
include(QtCopyQmlTo)
QtCopyQmlTo(${qml_dir})

add_executable(
    custom-property-types-example
    app.qml
    chapter4-customPropertyTypes.qrc
    main.cpp
    piechart.cpp
    piechart.h
    pieslice.cpp
    pieslice.h
    ${qt_conf}
    ${qml_dir}
)

set_target_properties(custom-property-types-example PROPERTIES RESOURCE "${qt_conf};${qml_dir}")

target_link_libraries(custom-property-types-example Qt5::Quick)
target_link_libraries(custom-property-types-example Qt5::Gui)
target_link_libraries(custom-property-types-example Qt5::QIOSIntegrationPlugin)
target_link_libraries(custom-property-types-example Qt5::Widgets)

### Plugins
target_link_libraries(custom-property-types-example Qt5::QmlQtQuick2Plugin)
