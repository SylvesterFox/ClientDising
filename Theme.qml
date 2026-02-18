pragma Singleton
import QtQuick 2.15

// ─────────────────────────────────────────────────────────────────────────────
// Theme.qml — глобальная тема приложения (singleton)
// Доступен везде как Theme.clr_xxx / Theme.mat
// ─────────────────────────────────────────────────────────────────────────────
QtObject {
    id: theme

    // Material Icons font
    // Положите MaterialIcons-Regular.ttf рядом с .qml файлами
    // https://github.com/google/material-design-icons/raw/master/font/MaterialIcons-Regular.ttf
    property FontLoader _fontLoader: FontLoader {
        source: "MaterialIcons-Regular.ttf"
    }
    readonly property string mat: _fontLoader.status === FontLoader.Ready
                                  ? _fontLoader.name
                                  : "Material Icons"

    // ── Backgrounds ────────────────────────────────────────────────
    readonly property color clr_rail:       "#1e2124"   // крайний левый рейл
    readonly property color clr_channels:   "#2f3136"   // панель каналов
    readonly property color clr_chat:       "#36393f"   // область чата
    readonly property color clr_members:    "#2f3136"   // панель участников
    readonly property color clr_userpanel:  "#292b2f"   // плашка пользователя
    readonly property color clr_voicebar:   "#2a2d31"   // Voice Connected бар
    readonly property color clr_input:      "#40444b"   // поле ввода
    readonly property color clr_search:     "#1e2124"   // поиск в участниках

    // ── Interactive states ─────────────────────────────────────────
    readonly property color clr_hover:      "#393c43"
    readonly property color clr_selected:   "#42464d"
    readonly property color clr_highlight:  "#2d3c2e"   // упоминание (зелёный фон)
    readonly property color clr_msg_hover:  "#32353b"

    // ── Dividers ───────────────────────────────────────────────────
    readonly property color clr_divider:    "#26282c"
    readonly property color clr_separator:  "#40444b"

    // ── Text ───────────────────────────────────────────────────────
    readonly property color clr_text:       "#dcddde"
    readonly property color clr_muted:      "#72767d"
    readonly property color clr_cat_text:   "#8e9297"

    // ── Accent ────────────────────────────────────────────────────
    readonly property color clr_green:      "#3ba55c"   // онлайн / упомянут
    readonly property color clr_hl_border:  "#3ba55c"   // левая полоска
    readonly property color clr_red:        "#ed4245"   // LIVE / ошибка
    readonly property color clr_accent:     "#5865f2"   // бренд
    readonly property color clr_mention:    "#e67e22"   // имя "Не милый"
}
