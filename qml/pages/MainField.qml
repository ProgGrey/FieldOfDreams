import QtQuick 2.0
import Sailfish.Silica 1.0
import "./gui"

Item {
    width:parent.width
    height:parent.height
    SilicaFlickable{
        id:content
        anchors.fill: parent
        Image {
            id:background
            source: "images/fon1.png"
            width:parent.width
            height:parent.height
            Board{id:board}
            Cylinder{
                y:parent.height - parent.width * 0.8
            }
            Alphabet{
                id:alphabet
            }
        }
    }

}
