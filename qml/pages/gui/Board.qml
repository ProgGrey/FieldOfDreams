import QtQuick 2.0
import Sailfish.Silica 1.0


Rectangle{
    id: field

    property int indent: 5;
    property int a: (parent.width - indent*12) / quardsCount;
    property int quardsCount: 6;

    property string word:""
    property int stringLen: word.length
    property int score:0



    width: quardsCount * (indent + a) + indent
    height: indent*4 + a*3
    x: (parent.width - width) /2
    y: 10
    color:"#000000"
    Grid{
        x:5
        y:400
        rows:2
        columns:field.quardsCount
        spacing:field.indent

        // Белые квадраты(Верхняя половина)
        Repeater{
            model: Math.floor((field.quardsCount * 3 - field.stringLen)/2)
            Rectangle {
                width: field.a
                height: field.a
                color:"#FFFFFF"
            }
        }

        //Поле с буквами
        Repeater{
            id: charBorder
            model: field.stringLen
            Rectangle {
                property string text:""
                width: field.a
                height: field.a
                color: "#0000FF"
                Text{
                    x:3*field.indent
                    y: -5*field.indent
                    font.pixelSize: field.a
                    color:"#000000"
                    text:parent.text
                }
                MouseArea{
                    width:parent.width
                    height:parent.height
                    onClicked:{
                        if(parent.text === ""){//Ещё не активирована
                            field.open(index);
                        }
                    }
                }
            }
        }

        // Белые квадраты(Нижняя половина)
        Repeater{
            model: Math.ceil((field.quardsCount * 3 - field.stringLen)/2)
            Rectangle {
                width: field.a
                height: field.a
                color: "#FFFFFF"
            }
        }


    }

    Rectangle{
        property int score;
        property int indent:5;
        x:500
        y:indent
        width: 200 - indent * 2
        height:55
        color:"#000000"

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

                    text:"ОЧКИ: " + score
                }

            }
        }
    }

}
