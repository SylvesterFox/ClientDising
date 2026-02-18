import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// VoiceUserRow.qml — пользователь в голосовом канале
// ─────────────────────────────────────────────────────────────────────────────
Item {
    id: root

    property string label:  ""
    property bool   isLive: false
    property color  avCol:  C.clr_accent

    width:  224
    height: 30
    anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined

    Row {
        anchors.left:           parent.left
        anchors.leftMargin:     36
        anchors.verticalCenter: parent.verticalCenter
        spacing: 6

        SqAvatar {
            sz:        20
            dotSz:     7
            initials:  root.label.length > 0 ? root.label[0].toUpperCase() : "?"
            bgColor:   root.avCol
            online:    true
            dotBorder: C.clr_channels
        }

        Text {
            text:           root.label
            font.pixelSize: 13
            color:          root.isLive ? C.clr_text : C.clr_muted
        }

        Rectangle {
            visible:                root.isLive
            width:                  30
            height:                 15
            radius:                 3
            color:                  C.clr_red
            anchors.verticalCenter: parent.verticalCenter

            Text {
                anchors.centerIn: parent
                text:           "LIVE"
                font.pixelSize: 9
                color:          "white"
                font.bold:      true
            }
        }
    }
}
