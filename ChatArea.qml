import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// ChatArea.qml — область чата (заголовок + сообщения + поле ввода)
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    id: root
    color: C.clr_chat

    ListModel {
        id: messages

        ListElement {
            mAuthor: "DragøN"; mTime: "06/14/2025 13:52"; mAvColor: "#7f8c8d"
            mHL: false; mSep: ""; mMeme: false
            mText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac leo  erat. Phasellus elit ipsum, eleifend sit amet varius in, fermentum eu  ante\n\nPraesent pretium nunc viverra, malesuada nisi vitae, volutpat lacus.  Proin eleifend at mauris sed facilisis. Sed condimentum sodales massa ut eleifend."
        }
        ListElement {
            mAuthor: "Не милый дракол\u200Bис"; mTime: "06/01/2025 19:41"; mAvColor: "#9b59b6"
            mHL: false; mSep: ""; mMeme: false
            mText: "Duis non risus ut lorem dignissim facilisis vitae non sem."
        }
        ListElement {
            mAuthor: "DragøN"; mTime: "06/05/2025 13:55"; mAvColor: "#7f8c8d"
            mHL: true; mSep: ""; mMeme: false
            mText: "Donec maximus ullamcorper lorem, eget aliquam urna. Mauris hendrerit risus id enim tincidunt, ac aliquam velit interdum."
        }
        ListElement {
            mAuthor: "DragøN"; mTime: "08/02/2025 19:45"; mAvColor: "#7f8c8d"
            mHL: false; mSep: ""; mMeme: false
            mText: "Donec augue augue, rhoncus vitae convallis in, vehicula et ipsum. Nam aliquam vel ante quis tincidunt. Maecenas at sapien ac libero gravida fringilla. Curabitur odio lacus, vehicula id dui a, ornare mattis lectus. Etiam enim dolor, tempor in aliquet sit amet, efficitur id enim. Sed aliquam dolor vitae varius sagittis. Donec tincidunt sit amet tellus nec bibendum. Morbi vitae enim a erat lacinia porta in vel lacus."
        }
        ListElement {
            mAuthor: ""; mTime: ""; mAvColor: ""; mHL: false
            mSep: "7 April 2026"; mMeme: false; mText: ""
        }
        ListElement {
            mAuthor: "DragøN"; mTime: "Today at 13:38"; mAvColor: "#7f8c8d"
            mHL: false; mSep: ""; mMeme: false; mText: "Сосал?"
        }
        ListElement {
            mAuthor: "Не милый дракол\u200Bис"; mTime: "Today at 23:38"; mAvColor: "#9b59b6"
            mHL: false; mSep: ""; mMeme: true; mText: "А НЕ ПОЙТИ ЛИ ТЕБЕ НАХУЙ"
        }
    }

    Column {
        anchors.fill: parent

        // ── Header ────────────────────────────────────────────────
        Rectangle {
            width: parent.width; height: 48; color: C.clr_chat
            Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: C.clr_divider }

            RowLayout {
                anchors.fill: parent; anchors.leftMargin: 16; anchors.rightMargin: 16; spacing: 8
                MI   { code: "\ue867"; sz: 26; col: C.clr_muted }
                Text { text: "основной-чат"; font.pixelSize: 16; color: C.clr_text; font.bold: true; Layout.fillWidth: true }
                Row {
                    spacing: 18
                    MI { code: "\ue7f4"; sz: 22 }
                    MI { code: "\ue7ef"; sz: 22 }
                    MI { code: "\ue55f"; sz: 22 }
                }
            }
        }

        // ── Message list ──────────────────────────────────────────
        ListView {
            id:    msgList
            width: parent.width; height: parent.height - 48 - 68
            clip:  true; model: messages
            ScrollBar.vertical: ScrollBar {}
            Component.onCompleted: positionViewAtEnd()

            delegate: MessageDelegate {
                width: msgList.width
            }
        }

        // ── Input ─────────────────────────────────────────────────
        Rectangle {
            width: parent.width; height: 68; color: C.clr_chat

            Rectangle {
                anchors.left: parent.left; anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 16; anchors.rightMargin: 16
                height: 44; radius: 8; color: C.clr_input

                RowLayout {
                    anchors.fill: parent; anchors.leftMargin: 12; anchors.rightMargin: 12; spacing: 8

                    MI { code: "\ue226"; sz: 24 }

                    Item {
                        Layout.fillWidth: true; height: 44
                        TextInput {
                            id: chatInput
                            anchors.left: parent.left; anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            color: C.clr_text; font.pixelSize: 14; clip: true
                        }
                        Text {
                            anchors.left: parent.left; anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            text:    "Написать в #основной-чат"
                            color:   C.clr_muted; font.pixelSize: 14
                            visible: chatInput.text.length === 0 && !chatInput.activeFocus
                        }
                    }

                    Row {
                        spacing: 8
                        MI { code: "\ue8f6"; sz: 22 }
                        MI { code: "\ue24e"; sz: 22 }
                    }
                }
            }
        }
    }
}
