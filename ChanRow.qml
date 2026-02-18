import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// ChanRow.qml — строка одного канала в боковой панели
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    id: root

    property string matCode: "\ue867"
    property string label:   ""
    property bool   active:  false

    width:  224
    height: 32
    radius: 4
    color:  active ? C.clr_selected : "transparent"
    anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape:  Qt.PointingHandCursor
        onEntered: { if (!root.active) root.color = C.clr_hover }
        onExited:  { if (!root.active) root.color = "transparent" }
    }

    Row {
        anchors.left:           parent.left
        anchors.leftMargin:     8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5

        MI {
            code: root.matCode
            sz:   18
            col:  root.active ? C.clr_text : C.clr_muted
        }
        Text {
            text:           root.label
            font.pixelSize: 14
            color:          root.active ? C.clr_text : C.clr_muted
            font.bold:      root.active
        }
    }
}
