import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MFloat

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("MFloat_Example")

    MFrame {
        anchors.centerIn: parent
        width: 300
        height: 400
        ScrollView {
            anchors.fill: parent
            ScrollBar.vertical: ScrollBar {
                     policy: ScrollBar.AlwaysOff
            }
            ColumnLayout {
                width: parent.parent.width
                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 10
                    spacing: 10
                    Text {
                        text: "MButton 带三种状态的按钮"
                        font.family: "黑体"
                        color: "#008c8c"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    RowLayout {
                        spacing: 10
                        MButton {
                            text: "调整进度条"
                            btnType:MButton.FBtnType.Ordinary
                            onClicked: {
                                bar.value = Math.floor(Math.random() * 100) + 1
                            }
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
                    Text {
                        text: "MSwitchButton 开关按钮"
                        font.family: "黑体"
                        color: "#008c8c"
                        font.pixelSize: 14
                        font.bold: true
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
                    Text {
                        text: "MProgressBar 进度条"
                        font.family: "黑体"
                        color: "#008c8c"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    MProgressBar {
                        id: bar
                        showText: true
                        value: 30
                    }
                    Text {
                        text: "MLabel 带颜色的label"
                        font.family: "黑体"
                        color: "#008c8c"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    Row {
                        spacing: 10
                        MLabel {
                            text: "你好世界"
                            hMargin: 20
                            vMargin: 10
                            radius: 10
                        }
                        MLabel {
                            text: "MHDUIY"
                            rectColor: "#000000"
                            textColor: "#ffffff"
                            hMargin: 15
                            vMargin: 10
                            radius: 10
                        }
                    }
                    Text {
                        text: "MCheckBox 多选框"
                        font.family: "黑体"
                        color: "#008c8c"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    MCheckBox {
                        tristate: true
                        checkState: Qt.Unchecked
                    }
                    Text {
                        text: "MFrame 带动画的窗口框架"
                        font.family: "黑体"
                        color: "#008c8c"
                        font.pixelSize: 14
                        font.bold: true
                    }

                    MFrame {
                        height: 50
                        width: 100
                    }

                    Text {
                        text: "MLineEdit 编辑框"
                        font.family: "黑体"
                        color: "#008c8c"
                        font.pixelSize: 14
                        font.bold: true
                    }

                    MLineEdit {
                        width: 200
                        placeholderText: "账号"
                    }

                    MLineEdit {
                        width: 200
                        placeholderText: "密码"
                    }
                }
            }
        }
    }
}
