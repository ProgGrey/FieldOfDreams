import QtQuick 2.0
import Sailfish.Silica 1.0
import "./gui"

Item {

    property bool stat: true;
    function block_alphabet()
    {
        if (stat == false){
            alphabet.visible = true;
            stat = true;
            console.log("alph unblocked")
        } else {
            alphabet.visible = false;
            stat = false;
            console.log("alph blocked")
        }
    }

    function block_cylinder()
    {
        if (cylinder.enabled == false){
            cylinder.enabled = true;
            console.log("cyl unblocked");
        } else {
            cylinder.enabled = false;
            console.log("cyl blocked");
        }
    }

    function ai_rotate()
    {
        cylinder.ai_rotate();
    }

    function delete_char(c)
    {
        alphabet.delete_char(c);
    }
    function get_deleted_chars()
    {
        return alphabet.get_deleted_chars();
    }

    width:parent.width
    height:parent.height
    SilicaFlickable{ 
        id:content
        anchors.fill: parent
        Image {
            id:background
            source: "images/fon1.png"
            width:parent.width
            height:parent.height
            Board{id:board}
            Cylinder{
                id: cylinder
                y:parent.height - parent.width * 0.8
            }
            Alphabet{
                id:alphabet
            }
        }
    }

}
