import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// MemCat.qml — заголовок категории участников  (ГЛАВНЫЙ АДМИН • 1)
// ─────────────────────────────────────────────────────────────────────────────
Item {
    property string label: ""

    width:  240
    height: 30

    Text {
        anchors.left:           parent.left
        anchors.leftMargin:     16
        anchors.verticalCenter: parent.verticalCenter
        text:           label.toUpperCase()
        color:          C.clr_cat_text
        font.pixelSize: 11
        font.bold:      true
    }
}
