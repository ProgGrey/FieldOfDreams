import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

// Модуль сохранения и загрузки игры.
Item{
    id: saveload

    property string question
    property string answer
    property string deletedChars
    property int score
    property bool isAI

    Component.onCompleted: {load();}
    
// Модуль загрузки сохранённой игры из базы данных
    function  load()
    {
        var db = LocalStorage.openDatabaseSync("SaveLoadDatabase", "1.0", 250)
        db.transaction(
            function(tx) {
                var rs = tx.executeSql('SELECT question, answer, deletedChars, score, isAI FROM SaveLoad WHERE id = 0');
                question = rs.rows.item(0).question;
                answer = rs.rows.item(0).answer;
                deletedChars = rs.rows.item(0).deletedChars;
                score = rs.rows.item(0).score;
                isAI = rs.rows.item(0).isAI;
            }
        )
    }
// Модуль сохранения игры в базу данных
    function save() {
        var db = LocalStorage.openDatabaseSync("SaveLoadDatabase", "1.0", 250)

        db.transaction(
            function(tx) {
		tx.executeSql('CREATE TABLE IF NOT EXISTS SaveLoad(id INTEGER UNIQUE, question STRING, answer STRING, deletedChars STRING, score INT, isAI BOOL)');
                tx.executeSql('INSERT OR REPLACE INTO SaveLoad(id, question, answer, deletedChars, score, isAI) VALUES(0,?,?,?,?,?)', [question, answer, deletedChars, score, isAI]);
            }
        )

    }
}

