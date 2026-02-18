import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: mainWindow
    visible: true
    height: 600
    title: "Chat App"

    Material.theme: Material.Dark
    Material.accent: Material.Blue

    property bool chatDetached: false

    // WIDTH AUTO RESIZE
    width: leftPanel.width +
           (chatDetached ? 0 : chatRoot.implicitWidth)

    Behavior on width {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#2b2d31"

        RowLayout {
            anchors.fill: parent
            spacing: 0

            // LEFT PANEL
            ColumnLayout {
                id: leftPanel
                implicitWidth: 270
                Layout.preferredWidth: implicitWidth
                Layout.fillHeight: true
                spacing: 0

                // USER PANEL
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 70
                    color: "#232428"

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 10

                        Rectangle {
                            width: 40
                            height: 40
                            radius: 20
                            color: "#5865F2"

                            Label {
                                anchors.centerIn: parent
                                text: "D"
                                color: "white"
                                font.bold: true
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true

                            Label {
                                text: "Dragon"
                                color: "white"
                                font.bold: true
                            }

                            Label {
                                text: "Online"
                                color: "#00ff88"
                                font.pixelSize: 12
                            }
                        }

                        Button {
                            text: "⚙"
                            width: 32
                        }
                    }
                }

                // SERVERS + CHANNELS
                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 0

                    Rectangle {
                        id: serversBar
                        implicitWidth: 70
                        Layout.fillHeight: true
                        color: "#1e1f22"

                        ListView {
                            anchors.fill: parent
                            model: ["S1","S2"]

                            delegate: Button {
                                text: modelData
                                width: parent.width
                                height: 60
                            }
                        }
                    }

                    Rectangle {
                        id: channelsBar
                        implicitWidth: 200
                        Layout.fillHeight: true
                        color: "#2b2d31"

                        ListView {
                            anchors.fill: parent
                            model: ["# general","# memes"]

                            delegate: Button {
                                text: modelData
                                width: parent.width
                            }
                        }
                    }
                }
            }

            // CHAT AREA (attached mode)
            Loader {
                Layout.fillWidth: true
                Layout.fillHeight: true
                active: !chatDetached
                sourceComponent: chatComponent
            }
        }
    }

    // DETACHED WINDOW
    Window {
        id: chatWindow
        width: 900
        height: 600
        visible: chatDetached
        title: "Chat"
        color: "#313338"

        Loader {
            anchors.fill: parent
            sourceComponent: chatComponent
        }

        onVisibleChanged: {
            if (visible) {
                raise()
                requestActivate()
            }
        }

        onClosing: chatDetached = false
    }

    // CHAT COMPONENT
    Component {
        id: chatComponent

        Rectangle {
            id: chatRoot
            implicitWidth: 900
            implicitHeight: 600
            color: "#313338"

            RowLayout {
                anchors.fill: parent
                spacing: 0

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    // TOP BAR
                    Rectangle {
                        Layout.fillWidth: true
                        height: 40
                        color: "#383a40"

                        RowLayout {
                            anchors.fill: parent

                            Button {
                                text: chatDetached ? "Attach" : "Detach"

                                onClicked: {
                                    chatDetached = !chatDetached
                                }
                            }

                            Label {
                                text: "Chat"
                                color: "white"
                                anchors.centerIn: parent
                            }
                        }
                    }

                    // MESSAGES
                    ListView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        model: [
                            "Hello",
                            "Detached window works",
                            "Qt5 QML is powerful"
                        ]

                        delegate: Label {
                            text: modelData
                            color: "white"
                            padding: 10
                        }
                    }

                    // INPUT
                    Rectangle {
                        Layout.fillWidth: true
                        height: 60
                        color: "#383a40"

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 8

                            TextArea {
                                Layout.fillWidth: true
                                placeholderText: "Type message..."
                                color: "white"
                            }

                            Button {
                                text: "Send"
                            }
                        }
                    }
                }

                // USERS BAR
                Rectangle {
                    implicitWidth: 150
                    Layout.fillHeight: true
                    color: "#2b2d31"

                    ListView {
                        anchors.fill: parent
                        model: ["Dragon","Admin"]

                        delegate: Label {
                            text: modelData
                            color: "white"
                            padding: 10
                        }
                    }
                }
            }
        }
    }
}
