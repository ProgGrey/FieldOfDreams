import QtQuick 2.0

Item {

    Loader { id: aiModule }

    property string charVars: "абвгдежзийклмнопрстуфхцчшщъыьэюя"

    function set_difficulty(d)
    {
        if(d == 0)
        {
            aiModule.setSource("Low.qml");
        } else if (d == 1)
        {
            aiModule.setSource("Medium.qml");
        } else {
            aiModule.setSource("Hard.qml");
        }
    }

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
