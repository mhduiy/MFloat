import QtQuick

Item {
    id: root
    width: 300
    height: 60
    anchors.horizontalCenter: parent.horizontalCenter
    y: 60
    z: 100

    enum Type {
        Info = 0,
        Waining = 1,
        Error = 2
    }

    property var type: Type.Info
    function send(text, type, duration) {
        console.log(text, type, duration)
        if (duration <= 0) {
            return
        }

        content.text = text
        root.type = type
        root.state = "open"
        timer.interval = duration
        timer.start()
    }

    Timer {
        id: timer
        interval: 0
        repeat: false
        onTriggered: {
            root.state = "close"
            console.log("通知关闭")
        }
    }

    transitions: [
        Transition {
            from: "close"; to: "open"
            PropertyAnimation {
                target: root
                properties: "y, opacity"
                duration: 500
                easing.type: Easing.OutBack
            }
            PropertyAnimation {
                target: root
                properties: "width, height"
                duration: 500
                easing.type: Easing.InOutCirc
            }
            PropertyAnimation {
                target: contentRect
                properties: "opacity"
                duration: 500
                easing.type: Easing.InOutExpo
            }
        },
        Transition {
            from: "open"; to: "close"
            PropertyAnimation {
                target: root
                properties: "width, height"
                duration: 300
                easing.type: Easing.OutCirc
            }
            PropertyAnimation {
                target: contentRect
                properties: "opacity"
                duration: 300
                easing.type: Easing.OutCirc
            }
            PropertyAnimation {
                target: root
                properties: "y, opacity"
                duration: 300
                easing.type: Easing.InCirc
            }
        }
    ]

    states: [
        State {
            name: "open"
            PropertyChanges {
                target: root
                y: 60
                width: 300
                height: 60
                opacity: 1.0
            }
            PropertyChanges {
                target: contentRect
                opacity: 1.0
            }
        },
        State {
            name: "close"
            PropertyChanges {
                target: root
                y: 5
                width: 30
                height: 30
                opacity: 0.0
            }
            PropertyChanges {
                target: contentRect
                opacity: 0.0
            }
        }
    ]

    state: "close"

    Rectangle {
        id: backRect
        anchors.fill: parent
        color: "black"
        radius: 10
        clip: true
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            id: contentRect
            Text {
                id: content
                anchors.fill: parent
                text: "Hello World"
                color: "white"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Rectangle {
                height: 40
                width: 40
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                Image {
                    anchors.fill: parent
                    source: "../images/closeIcon.png"
                }
                MouseArea {
                    onClicked: {
                        console.log("点击")
                    }
                }
            }
        }
    }
}
