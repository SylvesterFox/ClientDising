import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// ChannelSidebar.qml — панель каналов (240px)
//   UserPanelTop (60) + serverBar (48) + ScrollView + VoiceBar (54) + UserPanelBottom (52)
// ─────────────────────────────────────────────────────────────────────────────
Rectangle {
    id: root

    property int totalHeight: 768   // привязать к parent.height из main.qml

    width:  240
    color:  C.clr_channels

    Column {
        anchors.fill: parent

        // ── Плашка пользователя (вверху) ────────────────────────
        UserPanelTop {}

        // ── Название сервера ─────────────────────────────────────
        Rectangle {
            width: 240; height: 48
            color: C.clr_channels

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width; height: 1; color: C.clr_divider
            }

            RowLayout {
                anchors.fill: parent; anchors.leftMargin: 16; anchors.rightMargin: 12

                Row {
                    spacing: 8; Layout.fillWidth: true
                    MI   { code: "\ue88a"; sz: 20 }
                    Text { text: "Драконья Пещера"; color: C.clr_text; font.pixelSize: 15; font.bold: true }
                    MI   { code: "\ue5c5"; sz: 20 }
                }
                MI { code: "\ue7fe"; sz: 20 }
            }
        }

        // ── Список каналов ───────────────────────────────────────
        ScrollView {
            width:  240
            // Высота = всё окно минус: UserPanelTop(60) + serverBar(48) + VoiceBar(54) + UserPanelBottom(52)
            height: root.totalHeight - 60 - 48 - 54 - 52
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            clip:   true

            Column {
                width: 240; spacing: 0; topPadding: 8

                CatHdr  { label: "Информация" }
                ChanRow { matCode: "\ue8fc"; label: "правила" }
                ChanRow { matCode: "\ue88e"; label: "информация" }

                CatHdr  { label: "Текстовые чаты" }
                ChanRow { matCode: "\ue867"; label: "основной-чат"; active: true }
                ChanRow { matCode: "\ue3f4"; label: "арты" }
                ChanRow { matCode: "\ue7ef"; label: "мемы" }
                ChanRow { matCode: "\ue867"; label: "исфб-канал" }
                ChanRow { matCode: "\ue2bd"; label: "свое-творчество" }

                CatHdr  { label: "Голосовые каналы" }
                ChanRow { matCode: "\ue050"; label: "голосовой-чат" }
                ChanRow { matCode: "\ue050"; label: "Голосовой чат" }

                // Активный голосовой (зелёная иконка)
                Rectangle {
                    width: 224; height: 32; radius: 4
                    color: C.clr_selected
                    anchors.horizontalCenter: parent.horizontalCenter

                    Row {
                        anchors.left: parent.left; anchors.leftMargin: 8
                        anchors.verticalCenter: parent.verticalCenter; spacing: 5
                        MI   { code: "\ue050"; sz: 18; col: C.clr_green }
                        Text { text: "Запасной голосовой чат"; font.pixelSize: 14; color: C.clr_text; font.bold: true }
                    }
                }

                VoiceUserRow { label: "Не милый дракол\u200Bис"; isLive: true;  avCol: "#9b59b6" }
                VoiceUserRow { label: "DragøN";                   isLive: false; avCol: "#7f8c8d" }
            }
        }

        // ── Voice Connected ───────────────────────────────────────
        VoiceBar { channelName: "Запасной голосовой чат"; timeText: "15:07" }

        // ── Мини-плашка пользователя (внизу) ─────────────────────
        UserPanelBottom {}
    }
}
