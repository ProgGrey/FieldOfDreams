import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0


Item{
    id: saverecord

    // Сложность игры
    property int difficulty
    // Счёт игрока
    property int score
    // Игрок победил?
    property bool isVictory

   // Добавить рекорд в базу данных.
    function add() {
        var db = LocalStorage.openDatabaseSync("RecordSaveDatabase", "1.0", 250)

        db.transaction(
            function(tx) {
            
             // Создаем RecordSave, если он еще не существует
                tx.executeSql('CREATE TABLE IF NOT EXISTS RecordSave(id INTEGER UNIQUE, difficulty INTEGER, score INTEGER, isVictory BOOL)');
             // Добавит или заменить RecordSave  
                tx.executeSql('INSERT OR REPLACE INTO RecordSave(id, difficulty, score, isVictory) VALUES(0,?,?,?)', [difficulty, score, isVictory]);
            }
        )

    }
}

