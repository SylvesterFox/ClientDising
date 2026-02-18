import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// MessageDelegate.qml — один элемент списка сообщений
//
// Ожидаемые поля модели: mAuthor, mTime, mAvColor, mHL, mSep, mMeme, mText
//
// BINDING LOOP FIX:
//   Проблема была: root.height → msgRow.implicitHeight,
//                  но msgRow внутри Rectangle с anchors.fill → Rectangle.height = root.height → loop.
//   Решение: Rectangle НЕ anchors.fill parent. Его height = msgRow.height + 20 (независимо от root).
//            root.height тоже = msgRow.height + 20. Нет цикла.
// ─────────────────────────────────────────────────────────────────────────────
Item {
    id: root

    // width задаётся снаружи через  delegate: MessageDelegate { width: listView.width }
    height: {
        if (mSep  !== "") return 36
        if (mMeme)        return msgRow.height + 20
        return msgRow.height + 20
    }

    // ── Date separator ────────────────────────────────────────────
    Item {
        visible:      mSep !== ""
        anchors.fill: parent                 // OK: у Item нет binding loop

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:  parent.left;  anchors.leftMargin:  16
            anchors.right: parent.right; anchors.rightMargin: 16
            height: 1; color: C.clr_separator
        }
        Rectangle {
            anchors.centerIn: parent
            width:  sepLbl.width + 20
            height: sepLbl.height + 6
            radius: 3
            color:  C.clr_chat
            Text {
                id: sepLbl; anchors.centerIn: parent
                text: mSep; color: C.clr_muted; font.pixelSize: 12
            }
        }
    }

    // ── Highlight background ──────────────────────────────────────
    // НЕ anchors.fill — высота явная, не зависит от root.height
    Rectangle {
        id: msgBg
        visible:      mSep === ""
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:  parent.top
        height:       msgRow.height + 20     // независимо от root.height → нет loop
        color:        mHL ? C.clr_highlight : "transparent"

        // Левая полоска упоминания
        Rectangle {
            visible: mHL
            anchors.left:   parent.left
            anchors.top:    parent.top
            anchors.bottom: parent.bottom
            width: 3; color: C.clr_hl_border
        }

        MouseArea {
            anchors.fill: parent; hoverEnabled: true
            onEntered: { if (!mHL) msgBg.color = C.clr_msg_hover }
            onExited:  { if (!mHL) msgBg.color = "transparent"   }
        }

        // ── Message content row ───────────────────────────────────
        Row {
            id:                 msgRow
            anchors.left:       parent.left
            anchors.right:      parent.right
            anchors.top:        parent.top
            anchors.leftMargin: mHL ? 20 : 16
            anchors.rightMargin: 16
            anchors.topMargin:  10
            spacing: 12

            // Avatar
            SqAvatar {
                sz:        40
                dotSz:     12
                initials:  mAuthor.length > 0 ? mAuthor[0].toUpperCase() : "?"
                bgColor:   mAvColor !== "" ? mAvColor : C.clr_muted
                online:    true
                dotBorder: mHL ? C.clr_highlight : C.clr_chat
            }

            // Body
            Column {
                id:      msgBody
                // Явная ширина без зависимости от parent.height → нет loop
                width:   root.width - (mHL ? 20 : 16) - 16 - 40 - 12
                spacing: 4

                // Name + timestamp
                Row {
                    spacing: 8
                    Text {
                        text:           mAuthor
                        color:          mAuthor.indexOf("милый") >= 0 ? C.clr_mention : C.clr_text
                        font.pixelSize: 15
                        font.bold:      true
                    }
                    Text {
                        text:                mTime
                        color:               C.clr_muted
                        font.pixelSize:      12
                        anchors.bottom:      parent.bottom
                        anchors.bottomMargin: 2
                    }
                }

                // Plain text
                Text {
                    visible:        !mMeme
                    text:           mText
                    color:          C.clr_text
                    font.pixelSize: 14
                    wrapMode:       Text.WordWrap
                    width:          parent.width
                }

                // Meme card
                Rectangle {
                    visible:      mMeme
                    width:        240; height: 224
                    radius:       6
                    color:        "#2c2e33"
                    border.color: C.clr_divider
                    border.width: 1

                    Column {
                        anchors.centerIn: parent; spacing: 10

                        Text {
                            text:           "А НЕ ПОЙТИ ЛИ ТЕБЕ НАХУЙ"
                            color:          "white"
                            font.pixelSize: 14; font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Rectangle {
                            width: 194; height: 152; radius: 4; color: "#3a3c43"
                            anchors.horizontalCenter: parent.horizontalCenter
                            Column {
                                anchors.centerIn: parent; spacing: 6
                                Text { text: "🐱"; font.pixelSize: 64; anchors.horizontalCenter: parent.horizontalCenter }
                                Text { text: "cat with hat"; color: C.clr_muted; font.pixelSize: 11; anchors.horizontalCenter: parent.horizontalCenter }
                            }
                        }
                    }
                }
            }
        }
    }
}
