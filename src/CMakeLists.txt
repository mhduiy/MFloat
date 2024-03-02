cmake_minimum_required(VERSION 3.20)

project(mfloatui VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick Qml)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Qml)

qt_standard_project_setup()

# 遍历所有源文件
file(GLOB_RECURSE SRC_PATHS *.cpp *.hpp)
foreach(filepath ${SRC_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND src_files ${filename})
endforeach(filepath)

# 遍历所有qml文件
file(GLOB_RECURSE QML_PATHS *.qml)
foreach(filepath ${QML_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND qml_files ${filename})
endforeach(filepath)

# 遍历所有资源文件
file(GLOB_RECURSE RES_PATHS *.qrc)
foreach(filepath ${RES_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND res_files ${filename})
endforeach(filepath)

# 在 Qt 的资源系统中为这些文件设置别名,设置后在qmldir中的路径才是正确的路径（参考FluentUI的设置方法）
foreach(filepath IN LISTS qml_files resource_files)
    string(REPLACE "imports/MFloat/" "" filename ${filepath})
    set_source_files_properties(${filepath} PROPERTIES QT_RESOURCE_ALIAS ${filename})
endforeach()

set(QT_SDK_DIR "${Qt${QT_VERSION_MAJOR}_DIR}")
cmake_path(GET QT_SDK_DIR PARENT_PATH QT_SDK_DIR)
cmake_path(GET QT_SDK_DIR PARENT_PATH QT_SDK_DIR)
cmake_path(GET QT_SDK_DIR PARENT_PATH QT_SDK_DIR)

# 设置qml模块输出目录
set(MFLOAT_QML_PLUGIN_DIRECTORY ${QT_SDK_DIR}/qml/MFloat)

qt_add_library(${PROJECT_NAME} SHARED)
qt_add_qml_module(${PROJECT_NAME}
    PLUGIN_TARGET "mfloatuipugin"
    OUTPUT_DIRECTORY ${MFLOAT_QML_PLUGIN_DIRECTORY}
    VERSION 1.0
    URI "MFloat"
    TYPEINFO "plugins.qmltypes"
    SOURCES ${src_files}
    QML_FILES ${qml_files}
    RESOURCES ${res_files}
    RESOURCE_PREFIX "/qt/qml"
)

target_link_libraries(${PROJECT_NAME} PUBLIC
    Qt${QT_VERSION_MAJOR}::CorePrivate
    Qt${QT_VERSION_MAJOR}::QuickPrivate
    Qt${QT_VERSION_MAJOR}::QmlPrivate
)
#安装
install(DIRECTORY ${MFLOAT_QML_PLUGIN_DIRECTORY} DESTINATION ${CMAKE_INSTALL_PREFIX}/imports)
