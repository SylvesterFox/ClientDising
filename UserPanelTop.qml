import QtQuick 2.15
import QtQuick.Layouts 1.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// UserPanelTop.qml — плашка текущего пользователя вверху канальной панели
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    width:  240
    height: 60
    color:  C.clr_userpanel

    RowLayout {
        anchors.fill:        parent
        anchors.leftMargin:  10
        anchors.rightMargin: 8
        spacing: 8

        SqAvatar {
            sz: 38; dotSz: 12
            initials: "SN"; emoji: "🦊"
            bgColor:   "#c8862a"
            online:    true
            dotBorder: C.clr_userpanel
        }

        Column {
            Layout.fillWidth: true
            spacing: 1
            Text { text: "SylvesterNotCute"; color: C.clr_text;  font.pixelSize: 13; font.bold: true }
            Text { text: "#0000";            color: C.clr_muted; font.pixelSize: 11 }
        }

        Row {
            spacing: 0

            // settings
            Rectangle {
                width: 28; height: 28; radius: 4; color: "transparent"
                MouseArea { anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor
                    onEntered: parent.color = C.clr_hover; onExited: parent.color = "transparent" }
                MI { anchors.centerIn: parent; code: "\ue8b8"; sz: 20 }
            }
            // headset
            Rectangle {
                width: 28; height: 28; radius: 4; color: "transparent"
                MouseArea { anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor
                    onEntered: parent.color = C.clr_hover; onExited: parent.color = "transparent" }
                MI { anchors.centerIn: parent; code: "\ue310"; sz: 20 }
            }
            // mic_off
            Rectangle {
                width: 28; height: 28; radius: 4; color: "transparent"
                MouseArea { anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor
                    onEntered: parent.color = C.clr_hover; onExited: parent.color = "transparent" }
                MI { anchors.centerIn: parent; code: "\ue02d"; sz: 20; col: C.clr_red }
            }
        }
    }
}
