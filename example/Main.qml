import QtQuick
import QtQuick.Controls
import "qrc:/example"

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Row {
        anchors.centerIn: parent
        spacing: 10
        MButton {
            text: "普通按钮"
            btnType:MButton.FBtnType.Ordinary
        }
        MButton {
            text: "建议按钮"
            btnType:MButton.FBtnType.Suggest
        }
        MButton {
            text: "警告按钮"
            btnType:MButton.FBtnType.Warning
        }
    }
}
