import QtQuick 2.0
import Sailfish.Silica 1.0

Page{
    Image{
        anchors.fill:parent
        source: "../images/fon1.png"
        Rectangle {
            anchors.fill:parent
            color:"#000000AA"
            Rectangle{
                x:parent.width*0.1
                y:parent.height*0.357
                width: parent.width*0.8
                height:parent.height*0.286
                color: "#777777"
                TextArea{
                    anchors.fill:parent
                    color:"#FFFFFF"
                    readOnly: true
                    text:"Сохранить текущий прогресс игры?"
                    font.bold: true
                    font.family: "Impact"
                    font.pixelSize:40
                    horizontalAlignment: TextEdit.AlignHCenter
                    anchors.centerIn: parent
                }
                Button{
                    y:b2.y - height - 5
                    x: parent.width*0.05
                    width: parent.width*0.9
                    text: "Сохранить игру"
                }
                Button{
                    id: b2
                    y:parent.height - height
                    x: parent.width*0.05
                    width: parent.width*0.9
                    text: "Выйти без сохранения"
                }
            }
        }
    }
}

