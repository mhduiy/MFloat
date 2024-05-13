cmake_minimum_required(VERSION 3.20)

set(BIN_NAME MFloat-Example-bin)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick)

set(resource_files
    example.qrc
)

qt_add_executable(${BIN_NAME}
    main.cpp
    ${resource_files}
)

find_library(MY_LIBRARY
    NAMES mylibrary
    PATHS ${MY_LIBRARY_PATH}
)

target_link_libraries(${BIN_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Quick
    mfloatui
)