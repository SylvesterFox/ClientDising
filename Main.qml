import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Colors.js" as C

// ─────────────────────────────────────────────────────────────────────────────
// main.qml — точка входа
//
// ТРЕБОВАНИЕ:  MaterialIcons-Regular.ttf должен быть добавлен в resources.qrc
//   <file>MaterialIcons-Regular.ttf</file>
//
// Скачать шрифт:
//   https://github.com/google/material-design-icons/raw/master/font/MaterialIcons-Regular.ttf
//
// FontLoader загружается ОДИН РАЗ здесь; все MI.qml используют font.family: C.mat = "Material Icons"
// ─────────────────────────────────────────────────────────────────────────────
ApplicationWindow {
    id:      root
    visible: true
    width:   1080
    height:  768
    title:   "Драконья Пещера"
    color:   C.clr_rail

    // Загружаем шрифт один раз для всего приложения
    FontLoader {
        id:     matIconsLoader
        source: "qrc:/MaterialIcons-Regular.ttf"
    }

    RowLayout {
        anchors.fill: parent
        spacing:      0

        // ── 1. Рейл серверов (72px) ───────────────────────────────
        ServerRail {
            Layout.fillHeight: true
        }

        // ── 2. Панель каналов (240px) ─────────────────────────────
        ChannelSidebar {
            Layout.fillHeight: true
            totalHeight:       root.height
        }

        // ── 3. Область чата ───────────────────────────────────────
        ChatArea {
            Layout.fillWidth:  true
            Layout.fillHeight: true
        }

        // ── 4. Панель участников (240px) ──────────────────────────
        MembersSidebar {
            Layout.fillHeight: true
        }
    }
}
