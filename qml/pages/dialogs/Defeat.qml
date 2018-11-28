import QtQuick 2.5
import Sailfish.Silica 1.0

Page {
    id: lose

                Rectangle {
                    anchors.fill: parent
                    Image {
                        source: "images/Defeat.png"
                        width: Screen.width
                        height: Screen.height
                        }
                    }
                Label{
                    font.family: "Impact"
                    font.bold: true
                    text: qsTr("Вы проиграли!")
                    x: parent.width / 2 - width / 2
                    y:parent.height / 8
                    color:"#FFFFFF"

                }
                MButton
                {
                    x: parent.width / 2 - width / 2
                    y: parent.height / 8 + 100
                    width: parent.width * 0.6
                    im_source: "images/button.png"
                    button_text: qsTr("Новая игра")
                    onClicked: pageStack.push(Qt.resolvedUrl("MainField.qml"))
                }
        }
