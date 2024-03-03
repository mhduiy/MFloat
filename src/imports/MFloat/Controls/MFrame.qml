import QtQuick

Rectangle {
    id: root
    width: 10
    height: 10
    property color wrapperColor: colorConstants.ordinaryBackColor

    ColorConstants {
        id: colorConstants
    }

    color: wrapperColor
    border.width: 1
    radius: 5 * width / 100
    border.color: colorConstants.ordinaryHoverColor
    opacity: 0

    ParallelAnimation {
        id: showAni
        NumberAnimation {
            target: root
            property: "scale"
            from: 0.8
            to: 1
            duration: 600
            easing.type: Easing.OutCirc
        }
        PropertyAnimation {
            target: root
            property: "opacity"
            from: 0
            to: 1
            duration: 600
        }
    }

    Component.onCompleted: {
        showAni.start()
    }

}
