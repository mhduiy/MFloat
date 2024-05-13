cmake_minimum_required(VERSION 3.20)

project(mfloatui VERSION 1.0)

find_package(QT NAMES Qt6 REQUIRED COMPONENTS Core Quick Qml)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Qml)

set(PLUGIN_OUTPUT_DIR ${PROJECT_BINARY_DIR}/plugins/)
set(LIB_NAME mfloatui)
set(LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}" CACHE STRING "Library install path")
set(QML_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/qt${QT_VERSION_MAJOR}/qml" CACHE STRING "Qml plugin install directory")

# 遍历所有头文件
file(GLOB_RECURSE HEAD_PATHS *.h)
foreach(filepath ${HEAD_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND head_files ${filename})
endforeach(filepath)

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
file(GLOB_RECURSE RES_PATHS *.png *.jpg *.svg *.ico *.js)
foreach(filepath ${RES_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND res_files ${filename})
endforeach(filepath)


# 在 Qt 的资源系统中为这些文件设置别名,设置后在qmldir中的路径才是正确的路径（参考FluentUI的设置方法）
foreach(filepath IN LISTS qml_files res_files)
    string(REPLACE "imports/MFloat/" "" filename ${filepath})
    set_source_files_properties(${filepath} PROPERTIES QT_RESOURCE_ALIAS ${filename})
endforeach()

qt_add_qml_module( ${LIB_NAME}
    PLUGIN_TARGET "mfloatuipugin"
    VERSION 1.0
    URI "MFloat"
    SHARED
    TYPEINFO "plugins.qmltypes"
    SOURCES ${src_files} ${head_files}
    QML_FILES ${qml_files}
    RESOURCES ${res_files}
    RESOURCE_PREFIX "/qt/qml"
    OUTPUT_DIRECTORY "${PLUGIN_OUTPUT_DIR}/MFloat"
)

target_link_libraries(${LIB_NAME} PUBLIC
    Qt${QT_VERSION_MAJOR}::CorePrivate
    Qt${QT_VERSION_MAJOR}::QuickPrivate
    Qt${QT_VERSION_MAJOR}::QmlPrivate
)

# Install library
install(TARGETS ${LIB_NAME} DESTINATION "${LIB_INSTALL_DIR}")

# Install plugin
install(TARGETS ${PLUGIN_NAME} DESTINATION "${QML_INSTALL_DIR}")
install(DIRECTORY "${PLUGIN_OUTPUT_DIR}/MFloat" DESTINATION "${QML_INSTALL_DIR}")
