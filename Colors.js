.pragma library
// ─────────────────────────────────────────────────────────────────────────────
// Colors.js  —  все цвета и имя шрифта в одном месте
// Импорт в QML:  import "Colors.js" as C
// Использование: color: C.clr_text
// ─────────────────────────────────────────────────────────────────────────────

// ── Backgrounds ──────────────────────────────────────────────────────────────
var clr_rail      = "#1e2124"   // крайний левый рейл
var clr_channels  = "#2f3136"   // панель каналов
var clr_chat      = "#36393f"   // область чата
var clr_members   = "#2f3136"   // панель участников
var clr_userpanel = "#292b2f"   // плашка пользователя
var clr_voicebar  = "#2a2d31"   // Voice Connected бар
var clr_input     = "#40444b"   // поле ввода
var clr_search    = "#1e2124"   // поиск в участниках

// ── Interactive states ────────────────────────────────────────────────────────
var clr_hover     = "#393c43"
var clr_selected  = "#42464d"
var clr_highlight = "#2d3c2e"   // фон упомянутого сообщения
var clr_msg_hover = "#32353b"

// ── Dividers ──────────────────────────────────────────────────────────────────
var clr_divider   = "#26282c"
var clr_separator = "#40444b"

// ── Text ──────────────────────────────────────────────────────────────────────
var clr_text      = "#dcddde"
var clr_muted     = "#72767d"
var clr_cat_text  = "#8e9297"

// ── Accent ────────────────────────────────────────────────────────────────────
var clr_green     = "#3ba55c"   // онлайн / успех
var clr_hl_border = "#3ba55c"   // левая полоска упоминания
var clr_red       = "#ed4245"   // LIVE / ошибка / выход
var clr_accent    = "#5865f2"   // бренд Discord
var clr_mention   = "#e67e22"   // имя "Не милый дракол"

// ── Font ─────────────────────────────────────────────────────────────────────
// Реальное family name внутри MaterialIcons-Regular.ttf.
// FontLoader должен быть загружен один раз в main.qml.
var mat = "Material Icons"
