import QtQuick 2.5
import Sailfish.Silica 1.0

Page {
    id: page

    // Эффективное значение будет ограничено ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All
    property bool isLoad:false;

    Rectangle {
        anchors.fill: parent
        //Загрузка фонового изображения
        Image {
            source: "./images/fon.png"
            width: Screen.width
            height: Screen.height
        }

        // Чтобы включить PullDownMenu, помещаем наш контент в SilicaFlickable
        SilicaFlickable {
            anchors.fill: parent

            // Скажем SilicaFlickable высоту контента.
            contentHeight: column.height


            // Помещаем наш контент в column. PageHeader всегда находится наверху
            // страницы, за которой следует наш контент.
            Column {
                id: column
                x: parent.width / 2 - width / 2
                y: parent.height * 2 - height *2
                width: page.width * 0.8
                spacing: Theme.paddingLarge
                //Загрузка логотипа "Поле чудес"
                Image
                {
                    source: "./images/logo1.png"
                    height: parent.width * 1.1
                    width: parent.width * 0.6
                    x: parent.width / 2 - width / 2
                    y: parent.width / 4
                }

                //Кнопка "Новая игра"
                MButton
                {
                    anchors.topMargin: parent.width / 4
                    x: parent.width / 2 - width / 2
                    width: parent.width 
                    im_source: "./images/button.png"
                    button_text: qsTr("Новая игра")
                    onClicked: pageStack.push(Qt.resolvedUrl("Kernel.qml"))
                }

                //Кнопка "Продолжить"
                MButton
                {
                    anchors.topMargin: parent.height / 16
                    x: parent.width / 2 - width / 2
                    width: parent.width
                    im_source: "./images/button.png"
                    button_text: qsTr("Продолжить")
                    onClicked: {
                        page.isLoad = true;
                        pageStack.push(Qt.resolvedUrl("Kernel.qml"));
                    }
                }

                //Кнопка "Настройки"
                MButton
                {
                    anchors.topMargin: parent.height / 16
                    x: parent.width / 2 - width / 2
                    width: parent.width
                    im_source: "./images/button.png"
                    button_text: qsTr("Настройки")
                    onClicked: pageStack.push(Qt.resolvedUrl("Settings.qml"))
                }

                //Кнопка "Рекорды"
                MButton
                {
                    anchors.topMargin: parent.height / 16
                    x: parent.width / 2 - width / 2
                    width: parent.width
                    im_source: "./images/button.png"
                    button_text: qsTr("Рекорды")
                    onClicked: pageStack.push(Qt.resolvedUrl("Records.qml"))
                }

                //Кнопка "Выход"
                MButton
                {
                    anchors.topMargin: parent.height / 16
                    x: parent.width / 2 - width / 2
                    width: parent.width
                    im_source: "./images/button.png"
                    button_text: qsTr("Выход")
                    onClicked: Qt.quit()
                }
            }
        }
    }
}


