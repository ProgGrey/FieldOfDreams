import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "./ai"

Page {
    id:kernel
    property string question:"Косинус, делённый на синус"
    property string word:"_________"
    property string answer:"котангенс"
    property int score:0
    property bool isAi:false
    property bool isFinished: false
    property int difficulty:0

    // Стартуем
    Component.onCompleted:{
        var isLoad = pageStack.currentPage.isLoad;
        var deletedChars = "";
        if (isLoad){// Загрузка старой игры
            saveLoad.load();
            settingsLoader.load();
            question = saveLoad.question;
            answer = saveLoad.answer;
            score = saveLoad.score;
            isAi = saveLoad.isAI;
            difficulty = settingsLoader.difficulty;
            deletedChars = saveLoad.deletedChars;
            // Передаём модулю Board отображаемое слово.
            word = "";
            for(var k = 0; k < answer.length; k++){
                if(deletedChars.indexOf(answer[k]) == -1){
                    kernel.word += '_';
                } else {
                    kernel.word += answer[k];
                }
            }
            // Конец секции кода требующей доработки
        } else {// новая игра
            settingsLoader.load();
            questionLoader.setSource("QuestionLoader.qml");
            kernel.difficulty = settingsLoader.difficulty;
        }
        ai.set_difficulty(kernel.difficulty);
        for(var k = 1; k < deletedChars.length; k++){
            if(kernel.answer.indexOf(deletedChars[k]) == -1){
                ai.delete_char(deletedChars[k], false);
            } else {
                ai.delete_char(deletedChars[k], true);
            }
            mainField.delete_char(deletedChars[k]);
        }
        // блокируем клавиатуру
        mainField.block_alphabet();
        console.log(answer, question);
    }

    // Прикрываем лавочку
    Component.onDestruction:{
        if (isFinished == false){
            saveLoad.deletedChars = mainField.get_deleted_chars();
            saveLoad.answer = answer;
            saveLoad.question = question;
            saveLoad.score = score;
            saveLoad.isAI = isAi;
            saveLoad.save();
        }
        //pageStack.push(Qt.resolvedUrl("dialogs/Exit.qml"));
    }

    AI{id:ai}
    Loader { id: questionLoader }
    SaveLoad{id:saveLoad}
    SettingsLoader{id:settingsLoader}
    MainField{id:mainField}

    // Конец игры
    function is_game_final()
    {
        var now = new Date();
        var date_str = now.getDay() + "." + now.getMonth() + "." + (now.getFullYear() - 2000);
        if(word.indexOf('_') == -1){
            isFinished = true;
            if (isAi){
                pageStack.push(Qt.resolvedUrl("dialogs/Defeat.qml"));
                var db = LocalStorage.openDatabaseSync("FieldsOfDreamDB", "1.0", "Fields of dream records", 256)
                db.transaction(
                    function(tx) {
                        tx.executeSql('CREATE TABLE IF NOT EXISTS Records(key INTEGER UNIQUE, date TEXT, difficulty INTEGER, score INTEGER, isVictory INTEGER)');//Создаём таблицу, если не существует
                        tx.executeSql('INSERT INTO Records(date, difficulty, score, isVictory) VALUES(?, ?, ?, 0)', [date_str, difficulty, score]);
                    }
                )
            } else {
                pageStack.push(Qt.resolvedUrl("dialogs/Victory.qml"));
                var db = LocalStorage.openDatabaseSync("FieldsOfDreamDB", "1.0", "Fields of dream records", 256)
                db.transaction(
                    function(tx) {
                        tx.executeSql('CREATE TABLE IF NOT EXISTS Records(key INTEGER UNIQUE, date TEXT, difficulty INTEGER, score INTEGER, isVictory INTEGER)');//Создаём таблицу, если не существует
                        tx.executeSql('INSERT INTO Records(date, difficulty, score, isVictory) VALUES(?, ?, ?, 1)', [date_str, difficulty, score]);
                    }
                )
            }
        }
    }

    // Ответ на вращение барабана пользователем
    function user_rotate(r)
    {
        switch(r){
            case 0:
                // 0 Ход переходит к компухтеру
                isAi = true;
                mainField.block_cylinder();
                mainField.ai_rotate();
                break;
            case -1:
                //сектор банкрот. Ход переходит к компухтеру
                score = 0;
                isAi = true;
                mainField.block_cylinder();
                mainField.ai_rotate();
                break;
            case -2:
                // сектор +1
                mainField.block_cylinder();
                mainField.block_alphabet();
                break;
            case -3:
                // сектор x2
                score *=2;
                mainField.block_cylinder();
                mainField.block_alphabet();
                break;
            default:
                score += r;
                mainField.block_cylinder();
                mainField.block_alphabet();
                break;
        }
    }

    // пользователь угадывает букву
    function user_char(c)
    {
        var flag = true;
        console.log("буква ", c);
        for(var k = 0; k < answer.length; k++){
            if (answer[k] ==c){
                word = word.slice(0, k) + c + word.slice(k+1, word.length);
                flag = false;
            }
        }
        console.log(word);
        // пользователь не угадал
        if(flag){
            mainField.block_alphabet();
            ai.delete_char(c, false);
            isAi = true;
            mainField.ai_rotate();
        } else {
            // пользователь угадал
            mainField.block_alphabet();
            mainField.block_cylinder();
            ai.delete_char(c, true);
            is_game_final();
        }
    }

    // ИИ повернул барабан
    function ai_rotate(r)
    {
        switch(r){
            case 0:
                // 0 Ход переходит к игроку
                isAi = false;
                mainField.block_cylinder();
                break;
            case -1:
                //сектор банкрот. Ход переходит к игроку
                isAi = false;
                mainField.block_cylinder();
                break;
            default:
                // ИИ угадывает букву
                var c = ai.ai_char();
                mainField.delete_char(c);
                var flag = true;
                console.log("ИИ сказал ", c);
                for(var k = 0; k < answer.length; k++){
                    if (answer[k] ==c){
                        word = word.slice(0, k) + c + word.slice(k+1, word.length);
                        flag = false;
                    }
                }
                // Компухтер не угадал
                if(flag){
                    mainField.block_cylinder();
                    ai.delete_char(c, false);
                    isAi = false;
                }else{
                    // Компухтер угадал. Свистопляска продолжается
                    is_game_final();
                    mainField.ai_rotate();
                    ai.delete_char(c, true);
                }
                break;
        }
    }
}
