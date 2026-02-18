import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// SqAvatar.qml — квадратный аватар со скруглёнными углами и онлайн-точкой
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    id: root

    property string initials:  "?"
    property string emoji:     ""
    property color  bgColor:   C.clr_muted
    property bool   online:    false
    property int    sz:        32
    property int    dotSz:     10
    property color  dotBorder: C.clr_channels

    width:        sz
    height:       sz
    radius:       Math.max(4, sz * 0.18)
    color:        bgColor
    border.color: Qt.rgba(0, 0, 0, 0.25)
    border.width: 1

    Text {
        anchors.centerIn: parent
        text:           root.emoji !== "" ? root.emoji : root.initials
        color:          "white"
        font.pixelSize: root.emoji !== "" ? root.sz * 0.55 : root.sz * 0.42
        font.bold:      root.emoji === ""
    }

    // Online dot
    Rectangle {
        visible:      root.online
        x:            root.sz - root.dotSz * 0.65
        y:            root.sz - root.dotSz * 0.65
        width:        root.dotSz
        height:       root.dotSz
        radius:       root.dotSz / 2
        color:        C.clr_green
        border.color: root.dotBorder
        border.width: 2
    }
}
