cmake_minimum_required(VERSION 3.20)

project(MFloat_Example VERSION 0.1 LANGUAGES CXX)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick)

# 无法成功编译资源文件，暂时换回老方法
#qt_standard_project_setup()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(resource_files
    example.qrc
)

set(QT_SDK_DIR "${Qt${QT_VERSION_MAJOR}_DIR}")
cmake_path(GET QT_SDK_DIR PARENT_PATH QT_SDK_DIR)
cmake_path(GET QT_SDK_DIR PARENT_PATH QT_SDK_DIR)
cmake_path(GET QT_SDK_DIR PARENT_PATH QT_SDK_DIR)

set(QML_IMPORT_PATH qrc:/qt/qml)

qt_add_executable(${PROJECT_NAME}
    main.cpp
)

qt_add_qml_module(${PROJECT_NAME}
    URI "MFloat_Example"
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES ${resource_files}
    RESOURCE_PREFIX "/"
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Quick
    mfloatui
)
