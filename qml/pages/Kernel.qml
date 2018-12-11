import QtQuick 2.0
import Sailfish.Silica 1.0
import "./ai"

Page {
    id:kernel
    property string question:"Синус, делённый на косинус"
    property string word:"_________"
    property string answer:"котангенс"
    property int score:0
    property bool isAi:false
    property bool isVictory: false
    property int difficulty:0

    // Стартуем
    Component.onCompleted:{
        var isLoad = pageStack.currentPage.isLoad;
        var deletedChars = "";
        if (isLoad){// Загрузка старой
            // Следущая часть кода требет доработки
            // Необходимо организовать передачу слова модулю Border
            saveLoad.load();
            settingsLoader.load();
            kernel.question = saveLoad.question;
            kernel.word = saveLoad.answer;
            kernel.score = saveLoad.score;
            kernel.isAi = saveLoad.isAI;
            kernel.difficulty = settingsLoader.difficulty;
            deletedChars = saveLoad.deletedChars;
            // Конец секции кода требующей доработки
        } else {// новая игра
            settingsLoader.load();
            questionLoader.setSource("QuestionLoader.qml");
            kernel.difficulty = settingsLoader.difficulty;
        }
        ai.set_difficulty(kernel.difficulty);
        for(var k = 0; k < deletedChars.length; k++){
            if(kernel.word.indexOf(deletedChars[k]) == -1){
                ai.delete_char(deletedChars[k], false);
            } else {
                ai.delete_char(deletedChars[k], true);
            }
            mainField.content.background.alphabet.delete_char(deletedChars[k]);
        }
    }
    AI{id:ai}
    Loader { id: questionLoader }
    SaveLoad{id:saveLoad}
    SettingsLoader{id:settingsLoader}
    MainField{id:mainField}

    // Ответ на вращение барабана
    function user_rotate(r)
    {
        switch(r){
            case 0:
                // 0 Ход переходит к компухтеру
                break;
            case -1:
                //сектор банкрот. Ход переходит к компухтеру
                score = 0;
                break;
            case -2:
                // сектор +1
                break;
            case -3:
                // сектор x2
                score *=2;
                break;
            default:
                score += r;
                break;
        }
    }
}
