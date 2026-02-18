import QtQuick 2.15
import QtQuick.Controls 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// ServerRail.qml — крайний левый рейл с иконками серверов (72px)
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    id: root
    width: 72
    color: C.clr_rail

    // Список серверов определён ВНУТРИ компонента — modelData будет доступен
    ListModel {
        id: serverModel
        ListElement { sEmoji: "🦊"; sColor: "#c05621" }
        ListElement { sEmoji: "🐺"; sColor: "#2d6a4f" }
        ListElement { sEmoji: "🦊"; sColor: "#b5451b" }
        ListElement { sEmoji: "🦝"; sColor: "#6d4c41" }
        ListElement { sEmoji: "🐱"; sColor: "#4a235a" }
    }

    ScrollView {
        anchors.fill:                parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy:   ScrollBar.AlwaysOff
        clip: true

        Column {
            width:         72
            spacing:       8
            topPadding:    12
            bottomPadding: 12

            // ── Home ──────────────────────────────────────────────
            Rectangle {
                width:  48; height: 48; radius: 24; color: C.clr_accent
                anchors.horizontalCenter: parent.horizontalCenter
                MI { anchors.centerIn: parent; code: "\ue88a"; sz: 28; col: "white" }
            }

            // ── Divider ───────────────────────────────────────────
            Rectangle {
                width: 32; height: 2; color: C.clr_separator
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // ── Active server (Dragon) — левая пилюля активности ─
            Item {
                width: 72; height: 48
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    x: 0; anchors.verticalCenter: parent.verticalCenter
                    width: 4; height: 36; radius: 2; color: "white"
                }
                SqAvatar {
                    anchors.right:          parent.right
                    anchors.rightMargin:    12
                    anchors.verticalCenter: parent.verticalCenter
                    sz: 48; bgColor: "#5865f2"; emoji: "🐉"
                }
            }

            // ── Other servers ─────────────────────────────────────
            Repeater {
                model: serverModel

                delegate: Item {
                    width: 72; height: 48
                    anchors.horizontalCenter: parent.horizontalCenter

                    SqAvatar {
                        id: srvAv
                        anchors.right:          parent.right
                        anchors.rightMargin:    12
                        anchors.verticalCenter: parent.verticalCenter
                        sz:      48
                        bgColor: model.sColor   // через model.property, не modelData
                        emoji:   model.sEmoji
                        radius:  hov.containsMouse ? 14 : 22
                        Behavior on radius { NumberAnimation { duration: 150 } }
                    }
                    MouseArea {
                        id:           hov
                        anchors.fill: srvAv
                        hoverEnabled: true
                        cursorShape:  Qt.PointingHandCursor
                    }
                }
            }

            // ── Add server ────────────────────────────────────────
            Rectangle {
                width: 48; height: 48; radius: 24; color: C.clr_channels
                anchors.horizontalCenter: parent.horizontalCenter
                MI { anchors.centerIn: parent; code: "\ue145"; sz: 28; col: C.clr_green }
            }
        }
    }
}
