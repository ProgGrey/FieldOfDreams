import QtQuick 2.0
import Sailfish.Silica 1.0
import "./ai"

Page {
    id:kernel
    property string question
    property string word
    property int score:0
    property bool isAi:false
    property bool isVictory: false
    property int difficulty:0

    // Стартуем
    Component.onCompleted:{
        var isLoad = pageStack.currentPage.isLoad;
        var deletedChars = "";
        if (isLoad){// Загрузка старой
            saveLoad.load();
            settingsLoader.load();
            kernel.question = saveLoad.question;
            kernel.word = saveLoad.answer;
            kernel.score = saveLoad.score;
            kernel.isAi = saveLoad.isAI;
            kernel.difficulty = settingsLoader.difficulty;
            deletedChars = saveLoad.deletedChars;
        } else {// новая игра
            settingsLoader.load();
            questionLoader.load();
            kernel.question = questionLoader.question;
            kernel.word = questionLoader.answer;
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
    QuestionLoader{id:questionLoader}
    SaveLoad{id:saveLoad}
    SettingsLoader{id:settingsLoader}
    MainField{id:mainField}
}
