import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// MI.qml — Material Icon по unicode-коду
// Использование:  MI { code: "\ue8b8" }
//                 MI { code: "\ue867"; sz: 18; col: "white" }
// ─────────────────────────────────────────────────────────────────────────────
Text {
    property string code: ""
    property int    sz:   22
    property color  col:  C.clr_muted

    text:           code
    font.family:    C.mat
    font.pixelSize: sz
    color:          col
}
