import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Item {
    id: item

    // Ответ
    property string answer:""
    // Вопрос
    property string question:""

    // База данных вопросов и ответов
    XmlListModel {
        id: xml

        query: "/DB/R"
        XmlRole {name: "question"; query: "Q/string()"}
        XmlRole {name: "answer"; query: "A/string()"}
          }

// Модуль загрузки вопроса из базы данных
    function load()
    {
        xml.source = "questions/" + Math.floor(115*Math.random()) + 1 + ".xml"
        var index = Math.floor(50*Math.random());
        answer = get(index).answer; // Вопрос
        question = get(index).question; // Ответ

        }
    }