import QtQuick 2.15
import QtQuick.Layouts 1.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// UserPanelBottom.qml — нижняя мини-плашка пользователя с кнопками звонка
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    width:  240
    height: 52
    color:  C.clr_userpanel

    Rectangle {
        anchors.top: parent.top
        width: parent.width; height: 1
        color: C.clr_divider
    }

    RowLayout {
        anchors.fill:        parent
        anchors.leftMargin:  10
        anchors.rightMargin: 8
        spacing: 8

        SqAvatar {
            sz: 32; dotSz: 10
            initials: "SN"; emoji: "🦊"
            bgColor:   "#c8862a"
            online:    true
            dotBorder: C.clr_userpanel
        }

        Column {
            Layout.fillWidth: true
            spacing: 1
            Text { text: "SylvesterNotCute"; color: C.clr_text;  font.pixelSize: 13; font.bold: true; elide: Text.ElideRight; width: parent.width }
            Text { text: "#0000";            color: C.clr_muted; font.pixelSize: 11 }
        }

        Row {
            spacing: 2

            // videocam_off
            Rectangle {
                width: 26; height: 26; radius: 4; color: "transparent"
                MouseArea { anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor
                    onEntered: parent.color = C.clr_hover; onExited: parent.color = "transparent" }
                MI { anchors.centerIn: parent; code: "\ue897"; sz: 18 }
            }

            // screen_share
            Rectangle {
                width: 26; height: 26; radius: 4; color: "transparent"
                MouseArea { anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor
                    onEntered: parent.color = C.clr_hover; onExited: parent.color = "transparent" }
                MI { anchors.centerIn: parent; code: "\ue0be"; sz: 18 }
            }

            // call_end (красная кнопка выхода)
            Rectangle {
                id: callEndBtn
                width: 26; height: 26; radius: 4; color: C.clr_red
                MouseArea { anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor
                    onEntered: callEndBtn.color = "#c0392b"; onExited: callEndBtn.color = C.clr_red }
                MI { anchors.centerIn: parent; code: "\ue0b1"; sz: 18; col: "white" }
            }
        }
    }
}
