import Sailfish.Silica 1.0

Image {
    property string button_text
    property string im_source
    property int status : 0

    signal clicked

    id: hint_icon
    source: im_source
    opacity: 0.95

    Button {
