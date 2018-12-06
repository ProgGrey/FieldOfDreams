import QtQuick 2.0
import Sailfish.Silica 1.0

Image {
    property string button_text
    property string im_source
    property int status : 0

    signal clicked

    id: hint_icon
    source: im_source
    opacity: 0.95

    Button {
            id: im_button
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        Text {
            anchors.centerIn: parent
            font.pixelSize: 50
            font.family: "Impact"
            font.bold: true
            text: button_text
            color: "white"
        }
        color: "black"
        onClicked: parent.clicked()
    }
}
