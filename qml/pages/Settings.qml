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
                                 
                                 onPressed:{
                                     if (button1.pressed == false){
                                         button1.state = "BUTTON_PRESSED"
                                         button1.pressed = true
                                     }
                                     else{
                                         button1.state = "BUTTON_RELEASED"
                                         button1.pressed = false
                                     }
                                 }
                           }
                      }
                }

                Text {
                    x: parent.width / 9 - width / 9
                    y: parent.height / 2 - height / 2
                    anchors.topMargin: parent.width / 12
                    font.family: "Impact"
                    font.pixelSize: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Средний")
                    font.bold: true
                    color: "white"
                }

                //Кнопка среднего уровня сложности (2 звезды)
                Button{
                    x: parent.width /0.75 - width /0.75
                    y: parent.height / 2 - height / 2
                    anchors.topMargin: parent.width / 5
                        Image {
                             id: button2
                             width: 160
                             height: 80
                             smooth: true
                             visible: true
                             clip: true
                             opacity: 1.0
                             source: "two yellow star.png"
                             property bool pressed: false

                             states:[
                                 State {
                                     name: "BUTTON_PRESSED"
                                     PropertyChanges { target: button2; source: "two yellow star.png"}
                                 },
                                 State {
                                     name: "BUTTON_RELEASED"
                                     PropertyChanges { target: button2; source: "two red stars.png"}
                                 }
                             ]

                             MouseArea{
                                 anchors.fill:parent
                                 anchors.bottom: parent.bottom
                                 width:parent.width
                                 height: parent.height
                                 onClicked:{
                                    button1.source = "star1.png";
                                    button3.source = "three yellow stars.png";
                                  }

                                 onPressed:{
                                     if (button2.pressed == false){
                                         button2.state = "BUTTON_PRESSED"
                                         button2.pressed = true
                                     }
                                     else{
                                         button2.state = "BUTTON_RELEASED"
                                         button2.pressed = false
                                     }
                                 }
                           }
                      }
                }

                Text {
                    x: parent.width / 9 - width / 9
                    y: parent.height / 1.73 - height / 1.73
                    anchors.topMargin: parent.width / 12
                    font.family: "Impact"
                    font.pixelSize: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Сложный")
                    font.bold: true
                    color: "white"
                }

                //Кнопка сложного уровня сложности (3 звезды)
                Button{
                    x: parent.width /0.8 - width /0.8
                    y: parent.height / 1.7 - height / 1.7
                    anchors.topMargin: parent.width / 5
                        Image {
                             id: button3
                             width: 210
                             height: 70
                             smooth: true
                             visible: true
                             clip: true
                             opacity: 1.0
                             source: "three yellow stars.png"
                             property bool pressed: false

                             states:[
                                 State {
                                     name: "BUTTON_PRESSED"
                                     PropertyChanges { target: button3; source: "three yellow stars.png"}
                                 },
                                 State {
                                     name: "BUTTON_RELEASED"
                                     PropertyChanges { target: button3; source: "three red stars.png"}
                                 }
                             ]

                             MouseArea{
                                 anchors.fill:parent
                                 anchors.bottom: parent.bottom
                                 width:parent.width
                                 height: parent.height
                                 onClicked:{
                                    button1.source = "star1.png";
                                    button2.source = "two yellow star.png";
                                  }

                                 onPressed:{
                                     if (button3.pressed == false){
                                         button3.state = "BUTTON_PRESSED"
                                         button3.pressed = true
                                     }
                                     else{
                                         button3.state = "BUTTON_RELEASED"
                                         button3.pressed = false
                                     }
                                 }
                           }
                      }
                }

                //Отрисовка таблицы рекордов и его названия
                  Text
                  {
                      width: parent.width / 1.2
                      height: parent.height / 150
                      x: parent.width / 1.5 - width / 1.5
                      y: parent.height / 1.55 - height / 1.55
                      Image {
                          source: "button.png"
                          width: 600
                          height: 80
                          Text {
                              text: qsTr("Таблица рекордов :")
                              font.pixelSize: 45
                              anchors.centerIn: parent
                              font.bold: true
                              font.family: "Impact"
                              color: "white"
                          }
                      }
                  }

                  Text {
                      width: parent.width / 1.2
                      height: parent.height / 150
                      x: parent.width /0.19 - width /0.19
                      y: parent.height / 1.35 - height / 1.35
                      font.family: "Impact"
                      font.pixelSize: 45
                      anchors.horizontalCenter: parent.horizontalCenter
                      text: qsTr("Очистить таблицу")
                      font.bold: true
                      color: "white"
                  }

                  //Кнопка очистки таблицы рекордов
                  Button
                  {
                      width: parent.width / 1.2
                      x: parent.width /0.19 - width /0.19
                      y: parent.height / 1.3 - height / 1.3
                      Image {
                          source: "bak.png"
                          width: 80
                          height: 80
                      }
                    onClicked: stat.dropStat()
                }
            }
        }
    }
