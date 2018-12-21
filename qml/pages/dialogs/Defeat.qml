import QtQuick 2.5
import Sailfish.Silica 1.0

Page {
    Component.onDestruction:{
        pageStack.replaceAbove(null, Qt.resolvedUrl("../MainMenu.qml"));
    }
    MouseArea {
        anchors.fill: parent
        onClicked:{
            pageStack.pop();
        }
    }

    Image {
        anchors.fill: parent
        source: "../images/Defeat.png"
        width: Screen.width
        height: Screen.height
    }

    Label{
        font.family: "Impact"
        font.bold: true
        text: qsTr("Вы проиграли!")
        x: Screen.width / 2 - width / 2
        y: Screen.height / 8
        color:"#FFFFFF"

    }
}
