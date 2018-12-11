import QtQuick 2.0

Item {

    Loader { id: aiModule }

    property string charVars: "абвгдежзийклмнопрстуфхцчшщъыьэюя"
// Устанавливает сложность игры. d=0..2, что соответствует сложностям “легко”, “средне” и “сложно”. 
// После вызова этого метода частоты букв будут сброшены в первоначальное состояние. 
    function set_difficulty(d)
    {
        if(d == 0)
        {
            aiModule.setSource("Low.qml");
        } else if (d == 1)
        {
            aiModule.setSource("Medium.qml");
        } else {
            aiModule.setSource("Medium.qml");// Должно быть Hard, но этого модуля ещё нет
        }
    }
// возвращает букву, которую предсказал ИИ. 
// Если ИИ не угадал, ход переходит к игроку. 
// Этот метод не трогает частоту буквы.
    function ai_char()
    {
        while(aiModule.active != true){}
        var mass = Math.random();
        if (mass == 0.0){
            mass = 1;
        }

        //console.log("freqSum = ", aiModule.item.freqSum);
        //console.log(aiModule.item.frequencies);

        mass *= aiModule.item.freqSum;

        for (var k = 0; k < 32; k++) {
            mass -= aiModule.item.frequencies[k];
            if (mass <= 0){
                return charVars[k];
            }
        }
    }
// удаляет букву ch из памяти ИИ. Это происходит следующим образом: 
// буква преобразуется в номер в массиве и вызывается функция с аналогичным 
// именем из классов Low, Medium или Hard. isExist должна быть установлена в TRUE, 
// если буква есть в слове и в FALSE, если её там нет.
    function delete_char(ch, isExist)
    {
        for(var k = 0; k < 32; k++)
        {
            if (charVars[k] == ch)
            {
                aiModule.item.delete_char(k, isExist);
                break;
            }
        }
    }
}
