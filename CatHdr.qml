import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// CatHdr.qml — заголовок категории каналов  (ТЕКСТОВЫЕ ЧАТЫ ▸)
// ─────────────────────────────────────────────────────────────────────────────
Item {
    property string label:    ""
    property bool   expanded: true

    width:  232
    height: 28
    anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape:  Qt.PointingHandCursor
        onClicked:    expanded = !expanded
    }

    Row {
        anchors.left:           parent.left
        anchors.leftMargin:     8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 4

        MI { code: expanded ? "\ue5c5" : "\ue5c4"; sz: 14 }
        Text {
            text:           label.toUpperCase()
            color:          C.clr_cat_text
            font.pixelSize: 11
            font.bold:      true
        }
    }
}
