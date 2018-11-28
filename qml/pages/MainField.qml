import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // Эффективное значение будет ограничено ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // Чтобы включить PullDownMenu, поместите свой контент в SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu и PushUpMenu должны быть объявлены в SilicaFlickable, SilicaListView или SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Сообщите SilicaFlickable высоту его содержимого.
        contentHeight: column.height

        // Поместите наш контент в Column. PageHeader всегда размещается в верхней части
        // страницы, а затем наш контент.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("UI Template")
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Hello Sailors")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
        }
    }
}
