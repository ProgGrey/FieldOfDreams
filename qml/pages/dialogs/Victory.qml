import QtQuick 2.5
import Sailfish.Silica 1.0

Page {
    id: win
    SilicaFlickable {
        anchors.fill: parent
        Rectangle{
            PullDownMenu {
                MenuItem {
                    text: qsTr("Выйти в главное меню")
                    onClicked:{
                        pageStack.replaceAbove(null, Qt.resolvedUrl("MainMenu.qml"));
                    }
                }
            }
            
            Image {
                source: "images/fon1.png"
                width: Screen.width
                height: Screen.height
            }

            Label{
                font.family: "Impact"
                font.bold: true
                text: qsTr("Вы выиграли!")
                x: Screen.width / 2 - width / 2
                y: Screen.height / 8
                color:"#FFFFFF"
                
            }
        }
    }
}
