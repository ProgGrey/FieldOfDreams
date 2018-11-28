import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    id: page

    //Impact
    property var rs
    Component.onCompleted:{
        var db = LocalStorage.openDatabaseSync("FieldsOfDreamDB", "1.0", "Fields of dream records", 256)
        db.transaction(
            function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS Records(key INTEGER UNIQUE, date TEXT, difficulty INTEGER, score INTEGER, isVictory INTEGER)');//Создаём таблицу, если не существует
                rs = tx.executeSql('SELECT date, score FROM Records WHERE isVictory = 1 ORDER BY score DESC');
            }
        )

    }


    Image {
        id:background
        source: "images/fon1.png"
        width:parent.width
        height:parent.height

        /*Button{
            text:"Заполнить базу"
            onClicked:{
                var db = LocalStorage.openDatabaseSync("FieldsOfDreamDB", "1.0", "Fields of dream records", 256)
                db.transaction(
                    function(tx) {
                        tx.executeSql('CREATE TABLE IF NOT EXISTS Records(key INTEGER UNIQUE, date TEXT, difficulty INTEGER, score INTEGER, isVictory INTEGER)');//Создаём таблицу, если не существует
                        tx.executeSql('INSERT INTO Records(key, date, difficulty, score, isVictory) VALUES(0, \"06.09.18\", 2, 2000, 1)');
                        tx.executeSql('INSERT INTO Records(key, date, difficulty, score, isVictory) VALUES(1, \"07.09.18\", 1, 2500, 1)');
                        tx.executeSql('INSERT INTO Records(key, date, difficulty, score, isVictory) VALUES(2, \"08.09.18\", 3, 1000, 1)');
                        tx.executeSql('INSERT INTO Records(key, date, difficulty, score, isVictory) VALUES(3, \"08.09.18\", 3, 1000, 0)');
                    }
                )
            }
        }*/
        Rectangle{
            width:parent.width
            height:parent.height/14
            y:parent.height/14*1.5
            color: "#5d6769"
            Text{
                color:"#FFFFFF"
                text:"Рекорды"
                font.bold: true
                font.family: "Impact"
                font.pixelSize:parent.height*0.8
                anchors.centerIn:parent
            }
        }
        Rectangle{
            x:parent.width/8*0.9
            y:parent.height/14*3.5
            width:(parent.width - parent.width/4*0.9)/2
            height:parent.height/14
            color: "#777777"
            Text{
                color:"#222222"
                text:"Дата"
                font.bold: true
                font.family: "Impact"
                font.pixelSize:parent.height*0.8
                anchors.centerIn:parent
            }
        }
        Rectangle{
            x:parent.width/2
            y:parent.height/14*3.5
            width:(parent.width - parent.width/4*0.9)/2
            height:parent.height/14
            color: "#777777"
            Text{
                color:"#222222"
                text:"Очки"
                font.bold: true
                font.family: "Impact"
                font.pixelSize:parent.height*0.8
                anchors.centerIn:parent
            }
        }

        Item{
            y:parent.height/14*4.5
            x:parent.width/8*0.9
            width:(parent.width - parent.width/4*0.9)
            height:parent.height/7*4
            Rectangle{
                color:"#AAAAAA"
                height:background.height/14*rs.rows.length < parent.height ? background.height/14*rs.rows.length : parent.height
                width: parent.width
            }
            SilicaListView {
                model: rs.rows.length
                anchors.fill: parent
                delegate: BackgroundItem {
                    Rectangle{
                        width:parent.width/2
                        height:background.height/14
                        color: index % 2 == 1 ? "#DDDDDD" : "#AAAAAA"
                        Text{
                            color:"#111188"
                            text:rs.rows.item(index).date
                            font.bold: true
                            font.family: "Impact"
                            font.pixelSize:parent.height*0.5
                            anchors.centerIn:parent
                        }
                    }
                    Rectangle{
                        x:parent.width/2
                        width:parent.width/2
                        height:background.height/14
                        color: index % 2 == 1 ? "#DDDDDD" : "#AAAAAA"
                        Text{
                            color:"#111188"
                            text:rs.rows.item(index).score
                            font.bold: true
                            font.family: "Impact"
                            font.pixelSize:parent.height*0.5
                            anchors.centerIn:parent
                        }
                    }
                }
                VerticalScrollDecorator {}
            }
        }
    }
}
