import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Item {
    id: item

    // База данных вопросов и ответов
    XmlListModel {
        id: xml
        query: "/DB/R"
        source: "./questions/" + Math.floor(115*Math.random()) + ".xml"
        XmlRole {name: "question"; query: "Q/string()"}
        XmlRole {name: "answer"; query: "A/string()"}
        onStatusChanged: {
            if (status == XmlListModel.Ready) {
                var index = Math.floor(50*Math.random());
                //console.log(source, get(index).answer, get(index).question)
                item.parent.parent.answer = get(index).answer; // Вопрос
                item.parent.parent.question = get(index).question; // Ответ
                // Готовимся показать на табло пустую строку
                var str = "";
                for(var k = 0; k < item.parent.parent.answer.length; k++){
                    str += "_";
                }
                item.parent.parent.word = str;
            }
          }
    }
}
