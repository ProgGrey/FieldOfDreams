import QtQuick 2.0
import Sailfish.Silica 1.0

// Меню появляется снизу и активируется свайп жестом снизу вверх.
PushUpMenu {
    id: alphabetMenu
    property string charVars: "абвгдежзийклмнопрстуфхцчшщъыьэюя"
    property var isCharDeleted: [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]

      // Удаляет букву с клавиатуры
    function delete_char(c)
    {
        // Получаем позицию в алфавите
        var n = charVars.indexOf(c);
        // Получаем нужный элемент
        var tmp = alphabetKeyboard.itemAt(Math.floor(n/8));
        //console.log(c , " - ", Math.floor(n/8), n);
        //Удаляем букву
        isCharDeleted[n] = true;
        tmp.children[n % 8 + 1].visible = false;
    }

    // Получить удалённые буквы
    function get_deleted_chars()
    {
        var ret = "";
        for(var k = 0; k < 32; k++){
            if(isCharDeleted[k]){
                ret += charVars[k];
            }
        }
        return ret;
    }


    // Повторитель
    Repeater {
        id:alphabetKeyboard
         // 4 строки
        model:4
   
        // Статичный пункт меню, который просто отображает некоторый текст и не может быть нажат.
        MenuLabel {
            property int alphabetFirstRepeaterIndex: index;

            height:100;
            Repeater {
                // В каждой строке по 8 элементов
                model:8
                Button {
                    property int number: alphabetFirstRepeaterIndex*8+index

                    width:parent.width/8;
                    height:parent.height;
                    x:parent.width/8*index;
                    text:charVars[number]
                    onClicked: {
                        // Удаляем букву
                        isCharDeleted[number] = true;
                        visible = false;
                        // Выходим из меню
                        alphabetMenu.close();
                    }
                }
            }
        }
    }
}




