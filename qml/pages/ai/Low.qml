import QtQuick 2.0

Item {
    property var frequencies: [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    property int freqSum: 32

    function delete_char(c, isExist)
    {
        if (frequencies[c] != 0){
            freqSum--;
            frequencies[c] = 0;
        }
    }
}
