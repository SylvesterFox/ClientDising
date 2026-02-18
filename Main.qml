import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {

    id: root
    visible: true
    width: 1200
    height: 700
    title: "Chat App"

    property bool chatDetached: false

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // TOP BAR
        TopBar {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
        }

        // MAIN CONTENT
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            Rectangle {
                width: 70
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
                width: 200
                color: "#2b2d31"

                ListView {
                    anchors.fill: parent
                    model: ["#general","#memes"]

                    delegate: Button {
                        text: modelData
                        width: parent.width
                    }
                }
            }

            Loader {
                id: chatLoader
                Layout.fillWidth: true
                Layout.fillHeight: true
                active: !chatDetached
                source: "ChatComponent.qml"

                onLoaded: item.chatDetached = Qt.binding(function(){ return root.chatDetached })
            }
        }
    }

    Window {
        id: chatWindow
        visible: root.chatDetached
        width: 900
        height: 600
        title: "Chat Window"
        color: "#313338"

        ChatComponent {
            anchors.fill: parent
            chatDetached: root.chatDetached
        }

        onClosing: root.chatDetached = false
    }
}
