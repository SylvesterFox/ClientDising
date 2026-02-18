import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {

    id: root
    color: "#313338"

    property bool chatDetached: false

    RowLayout {

        anchors.fill: parent
        spacing: 0

        ColumnLayout {

            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {

                height: 40
                Layout.fillWidth: true
                color: "#383a40"

                Button {

                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter

                    text: root.chatDetached ? "Attach" : "Detach"

                    onClicked:
                        root.chatDetached = !root.chatDetached
                }
            }

            ListView {

                Layout.fillWidth: true
                Layout.fillHeight: true

                model: ["Hello","Qt5 works","Detached works"]

                delegate: Label {

                    text: modelData
                    color: "white"
                    padding: 10
                }
            }

            Rectangle {

                height: 60
                Layout.fillWidth: true
                color: "#383a40"

                RowLayout {

                    anchors.fill: parent
                    anchors.margins: 5

                    TextField {

                        Layout.fillWidth: true
                        placeholderText: "Type message..."
                    }

                    Button { text: "Send" }
                }
            }
        }

        Rectangle {

            width: 150
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
