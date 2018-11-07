import QtQuick 2.0

Item {
    property var frequencies: [ 3256, 787, 930, 808, 974, 2268, 185, 459, 2570, 163, 1803, 1755, 1016, 1882, 2793, 869, 2298, 1450, 1537, 952, 301, 203, 293, 292, 297, 51, 2, 181, 230, 110, 138, 220]
    property int freqSum: 31073

    function delete_char(n, isExist)
    {
        freqSum-=frequencies[n];
        frequencies[n] = 0;
    }
}
