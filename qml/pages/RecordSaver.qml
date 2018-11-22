import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0


Item{
    id: saverecord

    property int difficulty
    property int score
    property bool isVictory


    function add() {
        var db = LocalStorage.openDatabaseSync("RecordSaveDatabase", "1.0", 250)

        db.transaction(
            function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS RecordSave(id INTEGER UNIQUE, difficulty INTEGER, score INTEGER, isVictory BOOL)');
                tx.executeSql('INSERT OR REPLACE INTO RecordSave(id, difficulty, score, isVictory) VALUES(0,?,?,?)', [difficulty, score, isVictory]);
            }
        )

    }
}

