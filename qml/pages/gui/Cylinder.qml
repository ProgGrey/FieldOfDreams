import QtQuick 2.0

Item {
    property var sectors:[100, 900, -3, 600, 800, -2, 400, 1100, 0, -1, 500, 300, 200, 1000, 700, -2]

    property bool isAi:false;
       
    // Запускает процесс вращения барабана ИИ. Сначала проигрывается анимация вращения
    // барабана, потом вызывается ai_rotate(<кол-во выпавших очков>) из Kernel.
    function ai_rotate()
    {
        isAi = true;
        aiTimer.interval = rotateAnimation.from + Math.random()*7500;
        rotateAnimation.isRotate = true;
        aiTimer.start();
        if(cyl.rotation == 0){
            rotateAnimation.restart();
        } else{
            rotateAnimation.resume();
        }
    }

    width:parent.width
    height:parent.width

// Время
    Timer{
        id:aiTimer
        repeat: false;
        onTriggered:{
            rotateAnimation.pause();
            rotateAnimation.isRotate = false;
            var pos = Math.round(cyl.rotation*16/360);
            pos == 16 ? pos = 0 : pos = pos;
            parent.parent.parent.ai_rotate(sectors[pos]);
        }
    }
    
 //Загрузка изображения барабана
    Image {
        id:cyl
        source: "../images/barrel.png"
        width:parent.width * 0.8
        height:parent.height * 0.8
        x:parent.width * 0.1
        PropertyAnimation on rotation {
           property bool isRotate:false
           id:rotateAnimation
           from: 0
           to: 359
           duration: 5000
           running: false
           
           // Кнопка, останавливающая барабан.
           onStopped: {
               if (rotateAnimation.isRotate){
                   restart();
               }
           }
       }
    }

// Загрузка стрелы, указывающей на выпавшее кол-во очков.
    Image {
        source: "../images/arrow.png"
        width:parent.width * 0.2
        height:parent.height * 0.2
        x:parent.width-width
    }

// Обработка мыши
    MouseArea{
        width: parent.width*0.2
        height:parent.height*0.2
        x:parent.width*0.4
        y:parent.height*0.4*0.8
        onClicked:{
            if(rotateAnimation.isRotate){
                rotateAnimation.pause();
                rotateAnimation.isRotate = false;
                var pos = Math.round(cyl.rotation*16/360);
                pos == 16 ? pos = 0 : pos = pos;
                parent.parent.parent.user_rotate(sectors[pos]);
            } else {
                rotateAnimation.isRotate = true;
                if(cyl.rotation == 0){
                    rotateAnimation.restart();
                } else{
                    rotateAnimation.resume();
                }
            }
        }
    }

}
