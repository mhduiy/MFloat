import QtQuick
import QtQuick.Controls
import MFloat

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("MFloat_Example")

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

        MSwitchButton {
            onStatusChanged: {
                if (status) {
                    console.log("Switch is ON");
                } else {
                    console.log("Switch is OFF");
                }
            }
        }
    }
}
