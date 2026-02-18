import QtQuick 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// MemRow.qml — строка участника в правой боковой панели
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    id: root

    property string mName:    ""
    property string mStatus:  ""
    property color  mAvColor: C.clr_muted
    property string mBadge:   ""
    property color  mNameCol: C.clr_text
    property bool   mOnline:  true

    width:  224
    height: 44
    radius: 4
    color:  "transparent"
    anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape:  Qt.PointingHandCursor
        onEntered:    parent.color = C.clr_hover
        onExited:     parent.color = "transparent"
    }

    Row {
        anchors.left:           parent.left
        anchors.leftMargin:     8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 8

        SqAvatar {
            sz:        32
            dotSz:     10
            initials:  root.mName.length > 0 ? root.mName[0].toUpperCase() : "?"
            bgColor:   root.mAvColor
            online:    root.mOnline
            dotBorder: C.clr_members
        }

        Column {
            spacing: 1

            Row {
                spacing: 4
                Text {
                    text:           root.mName
                    color:          root.mNameCol
                    font.pixelSize: 13
                    font.bold:      true
                }
                Text {
                    visible:        root.mBadge !== ""
                    text:           root.mBadge
                    font.pixelSize: 14
                }
            }

            Text {
                visible:        root.mStatus !== ""
                text:           root.mStatus
                color:          C.clr_muted
                font.pixelSize: 11
                elide:          Text.ElideRight
                width:          150
            }
        }
    }
}
