import QtQuick 2.15
import QtQuick.Controls 2.15

\nApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: "Sidebar Example"

    Rectangle {
        width: 200
        height: parent.height
        color: "#2B2B2B"

       Column {
            anchors.fill: parent
            spacing: 10
            padding: 10

            Text {
                text: "Channels"
                font.bold: true
                color: "white"
            }

            ListView {
                model: ["Channel 1", "Channel 2", "Channel 3"]
                delegate: Item {
                    width: parent.width
                    height: 40
                    Rectangle {
                        width: parent.width
                        height: 40
                        color: "transparent"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: { /* Navigate to the channel */ } 
                        }
                        Text {
                            anchors.centerIn: parent
                            text: modelData
                            color: "white"
                        }
                    }
                }
            }

            Text {
                text: "Navigation"
                font.bold: true
                color: "white"
                spacing: 5
            }

            Column {
                spacing: 5
                Button {
                    text: "Home"
                    onClicked: { /* Navigate to home */ }
                }
                Button {
                    text: "Settings"
                    onClicked: { /* Navigate to settings */ }
                }
                Button {
                    text: "Logout"
                    onClicked: { /* Logout logic */ }
                }
            }
        }
    }
}