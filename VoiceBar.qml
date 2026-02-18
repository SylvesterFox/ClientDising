import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// VoiceBar.qml — плашка "Voice Connected" в канальной панели
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    id: root

    property string channelName: "Запасной голосовой чат"
    property string timeText:    "15:07"

    width:  240
    height: 54
    color:  C.clr_voicebar

    Rectangle {
        anchors.top: parent.top
        width: parent.width; height: 1
        color: C.clr_divider
    }

    Column {
        anchors.left:           parent.left
        anchors.leftMargin:     12
        anchors.verticalCenter: parent.verticalCenter
        spacing: 2

        Row {
            spacing: 6
            Rectangle {
                width: 8; height: 8; radius: 4
                color: C.clr_green
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text:           "Voice Connected"
                color:          C.clr_green
                font.pixelSize: 13
                font.bold:      true
            }
        }

        Text {
            text:           root.channelName
            color:          C.clr_muted
            font.pixelSize: 11
            elide:          Text.ElideRight
            width:          180
        }
    }

    Text {
        anchors.right:          parent.right
        anchors.rightMargin:    12
        anchors.verticalCenter: parent.verticalCenter
        text:           root.timeText
        color:          C.clr_muted
        font.pixelSize: 12
    }
}
