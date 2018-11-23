import QtQuick 2.5
import Sailfish.Silica 1.0

Page {
    id: page

    // Эффективное значение будет ограничено ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    Rectangle {
        anchors.fill: parent
        //Загрузка фонового изображения
        Image {
            source: "fon1.png"
            width: Screen.width
            height: Screen.height
        }

        // Чтобы включить PullDownMenu, помещаем наш контент в SilicaFlickable
        SilicaFlickable {
            anchors.fill: parent

            //Настройки
               MButton
               {
                   anchors.topMargin: parent.height / 16
                   x: parent.width / 2 - width / 2
                   width: parent.width
                   Image {
                       source: "button.png"
                       width: 800
                       height: 80
                       Text {
                           text: qsTr("Настройки")
                           font.pixelSize: 55
                           anchors.centerIn: parent
                           font.bold: true
                           font.family: "Impact"
                           color: "white"
                       }
                   }
               }

                //Отрисовка звука и его названия
                Text
                {
                    width: parent.width / 1.6
                    height: parent.height / 15
                    x: parent.width / 1.5 - width / 1.5
                    y: parent.height / 9 - height / 9
                    Image {
                        source: "button.png"
                        width: 400
                        height: 80
                        Text {
                            text: qsTr("Звук :")
                            font.pixelSize: 45
                            anchors.centerIn: parent
                            font.bold: true
                            font.family: "Impact"
                            color: "white"
                        }
                    }
                }

                Text {
                    x: parent.width / 9 - width / 9
                    y: parent.height / 4.5 - height / 4.5
                    anchors.topMargin: parent.width / 12
                    font.family: "Impact"
                    font.pixelSize: 30
                    text: qsTr("Включение/выключение звука")
                    font.bold: true
                    color: "white"
                }

                //Кнопка включения и выключения звука
                Button{
                    x: parent.width /0.67 - width /0.67
                    y: parent.height / 4.7 - height / 4.7
                    anchors.topMargin: parent.width / 5
                        Image {
                             id: button
                             width: 100
                             height: 100
                             smooth: true
                             visible: true
                             clip: true
                             opacity: 1.0
                             source: "sound on.png"
                             property bool pressed: false

                             states:[
                                 State {
                                     name: "BUTTON_PRESSED"
                                     PropertyChanges { target: button; source: "sound on.png"}
                                 },
                                 State {
                                     name: "BUTTON_RELEASED"
                                     PropertyChanges { target: button; source: "sound off.png"}
                                 }
                             ]

                             MouseArea{
                                 anchors.fill:parent
                                 anchors.bottom: parent.bottom
                                 width:parent.width
                                 height: parent.height

                                 onPressed:{
                                     if (button.pressed == false){
                                         button.state = "BUTTON_PRESSED"
                                         button.pressed = true
                                     }
                                     else{
                                         button.state = "BUTTON_RELEASED"
                                         button.pressed = false
                                     }
                                 }
                           }
                      }
                }

              //Отрисовка уровня сложности и его названия
                Text
                {
                    width: parent.width / 1.2
                    height: parent.height / 15
                    x: parent.width / 2 - width / 2
                    y: parent.height / 3 - height / 3
                    Image {
                        source: "button.png"
                        width: 600
                        height: 80
                        Text {
                            text: qsTr("Уровень сложности :")
                            font.pixelSize: 45
                            anchors.centerIn: parent
                            font.bold: true
                            font.family: "Impact"
                            color: "white"
                        }
                    }
                }

                Text {
                    x: parent.width / 9 - width / 9
                    y: parent.height / 2.37 - height / 2.37
                    anchors.topMargin: parent.width / 12
                    font.family: "Impact"
                    font.pixelSize: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Легкий")
                    font.bold: true
                    color: "white"
                }

                //Кнопка легкого уровня сложности (1 звезда)
                Button{
                    x: parent.width /0.67 - width /0.67
                    y: parent.height / 2.37 - height / 2.37
                    anchors.topMargin: parent.width / 5
                        Image {
                             id: button1
                             width: 80
                             height: 80
                             smooth: true
                             visible: true
                             clip: true
                             opacity: 1.0
                             source: "star1.png"
                             property bool pressed: false

                             states:[
                                 State {
                                     name: "BUTTON_PRESSED"
                                     PropertyChanges { target: button1; source: "star1.png"}
                                 },
                                 State {
                                     name: "BUTTON_RELEASED"
                                     PropertyChanges { target: button1; source: "star2.png"}
                                 }
                             ]

                             MouseArea{
                                 anchors.fill:parent
                                 anchors.bottom: parent.bottom
                                 width:parent.width
                                 height: parent.height
                                 onClicked: {
                                    button2.source = "two yellow star.png";
                                    button3.source = "three yellow stars.png";
                                 }
