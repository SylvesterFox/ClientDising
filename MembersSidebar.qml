import QtQuick 2.15
import QtQuick.Controls 2.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// MembersSidebar.qml — правая панель участников (240px)
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    width: 240
    color: C.clr_members

    ScrollView {
        anchors.fill:                parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        clip: true

        Column {
            width: 240; topPadding: 12; spacing: 0

            Rectangle {
                width: 208; height: 28; radius: 4; color: C.clr_search
                anchors.horizontalCenter: parent.horizontalCenter
                Row {
                    anchors.left: parent.left; anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter; spacing: 4
                    MI   { code: "\ue8b6"; sz: 16 }
                    Text { text: "Search"; color: C.clr_muted; font.pixelSize: 13 }
                }
            }

            Item { width: 1; height: 8 }

            MemCat { label: "Главный админ • 1" }
            MemRow { mName: "fizord";    mStatus: "Нарвим"; mAvColor: "#f47b4a"; mBadge: "👑" }

            MemCat { label: "Молочный дракон • 1" }
            MemRow { mName: "Не милый дракол\u200Bис"; mStatus: "Я не милый дракол\u200Bис прррр!"; mAvColor: "#9b59b6"; mNameCol: C.clr_mention }

            MemCat { label: "Боты • 1" }
            MemRow { mName: "IlyaBOT";   mStatus: "бееер"; mAvColor: "#3498db"; mBadge: "🤖" }

            MemCat { label: "Участники • 1" }
            MemRow { mName: "DragøN";    mStatus: "Я рй";  mAvColor: "#7f8c8d" }
        }
    }
}
