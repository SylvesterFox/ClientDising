import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: root
    visible: true
    width: 900
    height: 640
    minimumWidth: 900
    minimumHeight: 640
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "#1f2024"
    title: "Title"

    readonly property color pageBg: "#202126"
    readonly property color titleBg: "#2f3035"
    readonly property color railBg: "#1f2024"
    readonly property color channelsBg: "#27282e"
    readonly property color chatBg: "#24252a"
    readonly property color membersBg: "#28292f"
    readonly property color panelBg: "#303139"
    readonly property color inputBg: "#33343d"
    readonly property color selectedBg: "#373842"
    readonly property color greenBg: "#2f491e"
    readonly property color divider: "#3a3b42"
    readonly property color textMain: "#dbdde4"
    readonly property color textSoft: "#a6a8b0"
    readonly property color textMuted: "#777a84"
    readonly property color yellow: "#f6d736"
    readonly property color magenta: "#ff38e4"
    readonly property color onlineGreen: "#44b85a"
    readonly property color red: "#ff3452"

    FontLoader {
        id: appFont
        source: "qrc:/MaterialIcons-Regular.ttf"
    }

    component MaterialIcon: Text {
        property string symbol: ""
        text: symbol
        font.family: "Material Icons"
        font.pixelSize: 18
        color: root.textMain
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    component RoundButtonIcon: Rectangle {
        property string symbol: ""
        property color fill: "transparent"
        width: 28
        height: 28
        radius: 7
        color: mouse.containsMouse ? "#3b3c44" : fill

        MaterialIcon {
            anchors.centerIn: parent
            symbol: parent.symbol
            font.pixelSize: 17
            color: root.textSoft
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
        }
    }

    component Avatar: Rectangle {
        property string label: ""
        property color fill: "#dd8b4f"
        property bool online: false
        property bool muted: false
        width: 40
        height: 40
        radius: 9
        color: fill

        Rectangle {
            anchors.fill: parent
            anchors.margins: 3
            radius: parent.radius - 2
            color: Qt.rgba(0, 0, 0, 0.12)
            border.width: 1
            border.color: Qt.rgba(255, 255, 255, 0.08)
        }

        Text {
            anchors.centerIn: parent
            text: label
            color: "#ffffff"
            font.pixelSize: 15
            font.bold: true
        }

        Rectangle {
            visible: online
            width: 12
            height: 12
            radius: 6
            x: parent.width - width + 1
            y: parent.height - height + 1
            color: root.onlineGreen
            border.width: 3
            border.color: root.channelsBg
        }

        Rectangle {
            visible: muted
            width: 13
            height: 13
            radius: 6
            x: parent.width - width + 1
            y: parent.height - height + 1
            color: root.red
            border.width: 3
            border.color: root.channelsBg
        }
    }

    component ServerCell: Item {
        property color fill: "#2d2f36"
        property string label: ""
        property bool active: false
        width: 44
        height: 50

        Rectangle {
            visible: active
            x: 0
            y: 10
            width: 4
            height: 30
            radius: 2
            color: "#ffffff"
        }

        Avatar {
            width: 34
            height: 34
            radius: 9
            x: 10
            y: 8
            fill: parent.fill
            label: parent.label
        }
    }

    component ChannelRow: Rectangle {
        property string icon: "#"
        property string title: ""
        property bool selected: false
        property bool voice: false
        property bool live: false
        height: 25
        radius: 5
        color: selected ? root.selectedBg : "transparent"

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 9
            anchors.rightMargin: 7
            spacing: 7

            MaterialIcon {
                Layout.preferredWidth: 16
                symbol: voice ? "volume_up" : "tag"
                font.pixelSize: voice ? 14 : 16
                color: selected ? root.textMain : root.textSoft
            }

            Text {
                Layout.fillWidth: true
                text: title
                elide: Text.ElideRight
                color: selected ? "#ffffff" : root.textSoft
                font.pixelSize: 10
            }

            Rectangle {
                visible: live
                Layout.preferredWidth: 24
                Layout.preferredHeight: 10
                radius: 5
                color: root.red
                Text {
                    anchors.centerIn: parent
                    text: "LIVE"
                    color: "#ffffff"
                    font.pixelSize: 6
                    font.bold: true
                }
            }
        }
    }

    component SectionTitle: Item {
        property string title: ""
        height: 21
        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 8
            spacing: 4
            Text {
                text: title
                color: root.textMuted
                font.pixelSize: 9
            }
            MaterialIcon {
                symbol: "expand_more"
                color: root.textMuted
                font.pixelSize: 13
            }
        }
    }

    component MemberRow: Item {
        property string name: ""
        property string sub: ""
        property color nameColor: root.textSoft
        property color avatarColor: "#c78b5c"
        property string avatarLabel: ""
        property bool crown: false
        height: 43

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 9
            anchors.rightMargin: 9
            spacing: 8

            Avatar {
                Layout.preferredWidth: 31
                Layout.preferredHeight: 31
                radius: 8
                fill: avatarColor
                label: avatarLabel
                online: true
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 1
                Text {
                    Layout.fillWidth: true
                    text: name
                    color: nameColor
                    font.pixelSize: 10
                    font.bold: true
                    elide: Text.ElideRight
                }
                Text {
                    Layout.fillWidth: true
                    text: sub
                    color: root.textMuted
                    font.pixelSize: 8
                    elide: Text.ElideRight
                }
            }

            MaterialIcon {
                visible: crown
                Layout.preferredWidth: 15
                symbol: "emoji_events"
                color: root.yellow
                font.pixelSize: 14
            }
        }
    }

    component MessageLine: Item {
        property string user: "DragoN"
        property string time: "Сегодня в 21:02"
        property string body: ""
        property color nameColor: root.yellow
        property color avatarColor: "#b7bca3"
        property string avatarLabel: "D"
        property bool highlight: false
        property int bodySize: 11
        height: Math.max(58, messageText.implicitHeight + 30)

        Rectangle {
            anchors.fill: parent
            visible: highlight
            color: root.greenBg
        }

        Avatar {
            id: msgAvatar
            x: 16
            y: 10
            width: 34
            height: 34
            radius: 9
            fill: avatarColor
            label: avatarLabel
        }

        Text {
            id: msgName
            x: 58
            y: 9
            text: user
            color: nameColor
            font.pixelSize: 11
            font.bold: true
        }

        Text {
            x: msgName.x + msgName.implicitWidth + 7
            y: 11
            text: time
            color: root.textMuted
            font.pixelSize: 7
        }

        Text {
            id: messageText
            x: 58
            y: 25
            width: parent.width - 75
            text: body
            color: root.textMain
            wrapMode: Text.WordWrap
            font.pixelSize: bodySize
            lineHeight: 0.95
        }
    }

    Rectangle {
        anchors.fill: parent
        color: pageBg

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 22
                color: titleBg

                Text {
                    anchors.centerIn: parent
                    text: "Title"
                    color: "#ffffff"
                    font.pixelSize: 12
                    font.bold: true
                }

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 15
                    Text { text: "-"; color: "#ffffff"; font.pixelSize: 18; y: -2 }
                    Text { text: "↻"; color: "#ffffff"; font.pixelSize: 14 }
                    Text { text: "×"; color: "#ffffff"; font.pixelSize: 16 }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 0

                Rectangle {
                    Layout.preferredWidth: 52
                    Layout.fillHeight: true
                    color: railBg

                    Column {
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 6
                        spacing: 3
                        ServerCell { active: true; fill: "#d5693d"; label: "S" }
                        ServerCell { fill: "#422875"; label: "D" }
                        ServerCell { fill: "#31333b"; label: "••" }
                        ServerCell { fill: "#31333b"; label: "#" }
                        ServerCell { fill: "#e27d3f"; label: "K" }
                        ServerCell { fill: "#e27d3f"; label: "K" }
                        ServerCell { fill: "#e27d3f"; label: "K" }
                        ServerCell { fill: "#e27d3f"; label: "K" }
                    }

                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 8
                        width: 30
                        height: 30
                        radius: 8
                        color: "#333640"
                        Text {
                            anchors.centerIn: parent
                            text: "+"
                            color: "#ffffff"
                            font.pixelSize: 24
                            font.bold: true
                        }
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 166
                    Layout.fillHeight: true
                    color: channelsBg
                    border.width: 1
                    border.color: "#202126"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 51
                            color: channelsBg
                            border.width: 0

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.rightMargin: 9
                                spacing: 8

                                MaterialIcon { symbol: "home"; font.pixelSize: 16 }
                                Text {
                                    Layout.fillWidth: true
                                    text: "Драконья Пещера"
                                    color: "#ffffff"
                                    font.pixelSize: 10
                                    font.bold: true
                                    elide: Text.ElideRight
                                }
                                MaterialIcon { symbol: "expand_more"; font.pixelSize: 14 }
                                MaterialIcon { symbol: "person_add"; font.pixelSize: 15 }
                            }
                        }

                        Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 1; color: "#202126" }

                        ColumnLayout {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.topMargin: 9
                            Layout.leftMargin: 7
                            Layout.rightMargin: 7
                            spacing: 0

                            SectionTitle { Layout.fillWidth: true; title: "Информация" }
                            ChannelRow { Layout.fillWidth: true; title: "правила" }
                            ChannelRow { Layout.fillWidth: true; title: "информация" }
                            SectionTitle { Layout.fillWidth: true; title: "Текстовые чаты" }
                            ChannelRow { Layout.fillWidth: true; title: "основной-чат"; selected: true }
                            ChannelRow { Layout.fillWidth: true; title: "арты" }
                            ChannelRow { Layout.fillWidth: true; title: "мемы" }
                            ChannelRow { Layout.fillWidth: true; title: "ксф-кланы" }
                            ChannelRow { Layout.fillWidth: true; title: "свое-творчество" }
                            SectionTitle { Layout.fillWidth: true; title: "Голосовые каналы" }
                            ChannelRow { Layout.fillWidth: true; title: "голосовой-чат"; voice: true }
                            ChannelRow { Layout.fillWidth: true; title: "Голосовой чат"; voice: true }
                            ChannelRow { Layout.fillWidth: true; title: "Запасной голосовой чат"; voice: true; selected: true }

                            RowLayout {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 22
                                Layout.leftMargin: 28
                                spacing: 5
                                Avatar { Layout.preferredWidth: 16; Layout.preferredHeight: 16; radius: 5; fill: "#d5663d"; label: "N"; online: true }
                                Text { Layout.fillWidth: true; text: "Не милый драколис"; color: "#ffffff"; font.pixelSize: 8; elide: Text.ElideRight }
                                Rectangle {
                                    Layout.preferredWidth: 22
                                    Layout.preferredHeight: 9
                                    radius: 5
                                    color: root.red
                                    Text { anchors.centerIn: parent; text: "LIVE"; color: "#ffffff"; font.pixelSize: 5; font.bold: true }
                                }
                            }

                            RowLayout {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 22
                                Layout.leftMargin: 28
                                spacing: 5
                                Avatar { Layout.preferredWidth: 16; Layout.preferredHeight: 16; radius: 5; fill: "#b0b49d"; label: "D"; online: true }
                                Text { Layout.fillWidth: true; text: "DragoN"; color: "#ffffff"; font.pixelSize: 8; elide: Text.ElideRight }
                            }

                            Item { Layout.fillHeight: true }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 43
                            color: "#2c2d34"

                            Column {
                                anchors.left: parent.left
                                anchors.leftMargin: 8
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: 0
                                Row {
                                    spacing: 5
                                    MaterialIcon { symbol: "signal_cellular_alt"; color: "#57d35c"; font.pixelSize: 14 }
                                    Text { text: "Voice Connected"; color: "#51bf5c"; font.pixelSize: 8 }
                                }
                                Text { text: "Запасной голосовой чат"; color: root.textMuted; font.pixelSize: 7 }
                            }

                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 10
                                anchors.top: parent.top
                                anchors.topMargin: 8
                                text: "15:07"
                                color: root.textMuted
                                font.pixelSize: 7
                            }

                            Row {
                                anchors.right: parent.right
                                anchors.rightMargin: 13
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 6
                                spacing: 9
                                MaterialIcon { symbol: "mic_off"; color: "#ffffff"; font.pixelSize: 14 }
                                MaterialIcon { symbol: "headset_mic"; color: "#ffffff"; font.pixelSize: 14 }
                                MaterialIcon { symbol: "call_end"; color: "#ffffff"; font.pixelSize: 14 }
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: chatBg

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 48
                            color: chatBg

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 9
                                anchors.rightMargin: 13
                                spacing: 8

                                Rectangle {
                                    Layout.preferredWidth: 101
                                    Layout.preferredHeight: 32
                                    radius: 11
                                    color: "#30313a"
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: 8
                                        anchors.rightMargin: 8
                                        spacing: 5
                                        Text { text: "#"; color: "#ffffff"; font.pixelSize: 17; font.bold: true }
                                        Text { Layout.fillWidth: true; text: "основной-чат"; color: "#ffffff"; font.pixelSize: 8; elide: Text.ElideRight }
                                    }
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 32
                                    radius: 11
                                    color: "#2f3038"
                                    Text {
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: "Основной чат"
                                        color: root.textMuted
                                        font.pixelSize: 9
                                    }
                                }

                                RowLayout {
                                    Layout.preferredWidth: 72
                                    spacing: 6
                                    MaterialIcon { symbol: "notifications"; font.pixelSize: 15 }
                                    MaterialIcon { symbol: "badge"; font.pixelSize: 15 }
                                    MaterialIcon { symbol: "push_pin"; font.pixelSize: 15 }
                                }
                            }
                        }

                        Flickable {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            contentWidth: width
                            contentHeight: messagesColumn.height + 10
                            clip: true

                            Column {
                                id: messagesColumn
                                width: parent.width
                                spacing: 0

                                MessageLine {
                                    width: parent.width
                                    user: "DragoN"
                                    avatarLabel: "D"
                                    avatarColor: "#b7bca3"
                                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac leo erat. Phasellus elit ipsum, eleifend sit amet varius in, fermentum eu ante\n\nPraesent pretium nunc viverra, malesuada nisi vitae, volutpat lacus. Proin eleifend at mauris sed facilisis. Sed condimentum sodales massa ut eleifend."
                                }
                                MessageLine {
                                    width: parent.width
                                    height: 46
                                    user: "DragoN"
                                    avatarLabel: "D"
                                    avatarColor: "#b7bca3"
                                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac leo erat. Phasellus elit ipsum, eleifend sit amet varius in, fermentum eu"
                                    bodySize: 8
                                }
                                MessageLine {
                                    width: parent.width
                                    user: "Не милый драколис"
                                    nameColor: root.magenta
                                    avatarLabel: "N"
                                    avatarColor: "#c4522c"
                                    body: "Duis non risus ut lorem dignissim facilisis vitae non sem."
                                }
                                MessageLine {
                                    width: parent.width
                                    highlight: true
                                    user: "DragoN"
                                    avatarLabel: "D"
                                    avatarColor: "#b7bca3"
                                    body: "Donec maximus ullamcorper lorem, eget aliquam urna. Mauris hendrerit risus id enim tincidunt, ac aliquam velit interdum."
                                }
                                MessageLine {
                                    width: parent.width
                                    height: 88
                                    user: "DragoN"
                                    avatarLabel: "D"
                                    avatarColor: "#b7bca3"
                                    body: "Donec augue augue, rhoncus vitae convallis in, vehicula et ipsum. Nam aliquam vel ante quis tincidunt. Maecenas at sapien ac libero gravida fringilla. Curabitur odio lacus, vehicula id dui a, ornare mattis lectus. Etiam enim dolor, tempor in aliquet sit amet, efficitur id enim. Sed aliquam dolor vitae varius sagittis. Donec tincidunt sit amet tellus nec bibendum. Morbi vitae enim a erat lacinia porta in vel lacus. Quisque at quam in mauris tristique fermentum id vel turpis. Nunc quis ligula odio dolor faucibus iaculis vitae eu dui. Aliquam mattis lorem lacus, in tincidunt ante ornare nec."
                                }

                                Item {
                                    width: parent.width
                                    height: 31

                                    Rectangle {
                                        x: 38
                                        y: 15
                                        width: 184
                                        height: 1
                                        color: root.divider
                                    }

                                    Rectangle {
                                        x: 232
                                        y: 7
                                        width: 84
                                        height: 17
                                        radius: 9
                                        color: "#30313a"
                                        Text { anchors.centerIn: parent; text: "7 April 2026"; color: "#ffffff"; font.pixelSize: 10 }
                                    }

                                    Rectangle {
                                        x: 326
                                        y: 15
                                        width: Math.max(0, parent.width - 352)
                                        height: 1
                                        color: root.divider
                                    }
                                }

                                MessageLine {
                                    width: parent.width
                                    height: 47
                                    user: "DragoN"
                                    avatarLabel: "D"
                                    avatarColor: "#b7bca3"
                                    body: "Сосал?"
                                }
                                MessageLine {
                                    width: parent.width
                                    height: 64
                                    user: "Не милый драколис"
                                    nameColor: root.magenta
                                    avatarLabel: "N"
                                    avatarColor: "#c4522c"
                                    body: "Сообщение без картинки, как в макете: здесь оставлено место под обычный текстовый ответ."
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 52
                            color: chatBg

                            Rectangle {
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                anchors.bottomMargin: 14
                                height: 34
                                radius: 11
                                color: inputBg

                                MaterialIcon {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    symbol: "add_box"
                                    font.pixelSize: 18
                                }
                                Row {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 9
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 11
                                    MaterialIcon { symbol: "insert_photo"; font.pixelSize: 16 }
                                    MaterialIcon { symbol: "sentiment_satisfied"; font.pixelSize: 18 }
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 150
                    Layout.fillHeight: true
                    color: membersBg

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 48
                            color: membersBg

                            Rectangle {
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin: 9
                                anchors.rightMargin: 7
                                height: 18
                                radius: 6
                                color: "#1f2024"
                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 8
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "Search"
                                    color: root.textMuted
                                    font.pixelSize: 8
                                }
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.leftMargin: 6
                            Layout.rightMargin: 2
                            spacing: 0

                            Text {
                                Layout.fillWidth: true
                                Layout.topMargin: 11
                                text: "Главный админ - 1"
                                color: root.textMuted
                                font.pixelSize: 8
                            }
                            MemberRow {
                                Layout.fillWidth: true
                                name: "lizord"
                                sub: "Я Невин"
                                nameColor: "#ff9b1e"
                                avatarColor: "#d4692d"
                                avatarLabel: "L"
                                crown: true
                            }
                            Text { Layout.fillWidth: true; text: "Молчаливый дракон - 1"; color: root.textMuted; font.pixelSize: 8 }
                            MemberRow {
                                Layout.fillWidth: true
                                name: "Не милый драколис"
                                sub: "Ррр милый драколис рррр!"
                                nameColor: root.magenta
                                avatarColor: "#c24f2e"
                                avatarLabel: "N"
                            }
                            Text { Layout.fillWidth: true; text: "Боты - 1"; color: root.textMuted; font.pixelSize: 8 }
                            MemberRow {
                                Layout.fillWidth: true
                                name: "ИуаBOT"
                                sub: "beep"
                                nameColor: "#31b8ff"
                                avatarColor: "#3a607d"
                                avatarLabel: "B"
                            }
                            Text { Layout.fillWidth: true; text: "Участники - 1"; color: root.textMuted; font.pixelSize: 8 }
                            MemberRow {
                                Layout.fillWidth: true
                                name: "DragoN"
                                sub: "Я гей"
                                nameColor: root.yellow
                                avatarColor: "#b7bca3"
                                avatarLabel: "D"
                            }
                            Item { Layout.fillHeight: true }
                        }
                    }
                }
            }
        }
    }
}
