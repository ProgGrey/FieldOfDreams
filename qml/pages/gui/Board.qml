import QtQuick 2.0
import Sailfish.Silica 1.0

Item{
    id: field
    width: parent.width
    height: parent.height
    property int indent: 5;
    property int a: (parent.width - indent*12) / quardsCount;
    property int quardsCount: 6;

    property string word:parent.parent.parent.parent.parent.word
    property string question:parent.parent.parent.parent.parent.question
    property int stringLen: word.length
    property int score:0

    Rectangle{
        width: parent.width
        height: parent.height/14*4
        color:"#336699"
        TextArea{
            color:"#FFFFFF"
            text:field.question
            font.bold: true
            font.family: "Impact"
            font.pixelSize:25
            anchors.fill:parent
        }
    }

    // Белые квадраты(Верхняя половина)
    Repeater{
        model: 6
        Rectangle {
            x: field.indent + field.indent * index + field.a * index
            y:400
            width: field.a
            height: field.a
            color:"#FFFFFF"
            Text{
                color:"#000000"
                text:field.stringLen > index ? field.word[index] : ""
                font.bold: true
                font.family: "Impact"
                font.pixelSize:parent.height*0.8
                anchors.centerIn:parent
            }
        }
    }

    // Белые квадраты(Нижняя половина)
    Repeater{
        model: 6
        Rectangle {
            x: field.indent + field.indent * index + field.a * index
            y:400 + field.a + field.indent
            width: field.a
            height: field.a
            color: "#FFFFFF"
            Text{
                color:"#000000"
                text:field.stringLen > (index + 6) ? field.word[index + 6] : ""
                font.bold: true
                font.family: "Impact"
                font.pixelSize:parent.height*0.8
                anchors.centerIn:parent
            }
        }
    }

    Rectangle{
        property int indent:5;
        x:500
        y:indent
        width: 200 - indent * 2
        height:55
        color:"#FFFFFF"

        Rectangle{
            x:indent
            y:indent
            width: parent.width - indent * 2
            height: parent.height - indent * 2
            color:"#FFFFFF"

            Item {
                x: indent
                width: parent.width - indent * 2
                Text{

                    text:"ОЧКИ: " + field.score
                }

            }
        }
    }

}
