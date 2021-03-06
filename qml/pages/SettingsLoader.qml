import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

// Класс, ответственный за загрузку и сохранение настроек игры.
Item{
    id: settings

    // Сложность игры.
    property int difficulty
    // Включена ли фоновая музыка.
    property bool isMusic
     
    // Метод загрузки настроек из базы данных. После выполнения свойства difficulty и isMusic будут содержать загруженные значения. 
    function  load()
    {
        var db = LocalStorage.openDatabaseSync("SettingsDatabase", "1.0", 250)
        db.transaction(
            function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS Settings(id INTEGER UNIQUE, difficulty INTEGER, isMusic BOOL)');

                var rs = tx.executeSql('SELECT difficulty, isMusic FROM Settings WHERE id = 0');
                if (rs.rows.length === 0)
                {
                    difficulty = 0;
                    isMusic = true;
                } else {
                    difficulty = rs.rows.item(0).difficulty;
                    isMusic = rs.rows.item(0).isMusic;
                }


            }
        )
    }

    // Метод сохранения настроек в базу данных. Перед выполнением необходимо заполнить свойства difficulty и isMusic.
    function save() {
        var db = LocalStorage.openDatabaseSync("SettingsDatabase", "1.0", 250)

        db.transaction(
            function(tx) {
                tx.executeSql('INSERT OR REPLACE INTO Settings(id, difficulty, isMusic) VALUES(0,?,?)', [difficulty, isMusic]);
            }
        )

    }
}



