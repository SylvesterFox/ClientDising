import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {

    color: "#232428"

    RowLayout {

        anchors.fill: parent
        anchors.margins: 10

        Rectangle {

            width: 40
            height: 70
            radius: 20
            color: "#5865F2"

            Label {
                anchors.centerIn: parent
                text: "D"
                color: "white"
            }
        }

        ColumnLayout {

            Label {
                text: "Dragon"
                color: "white"
            }

            Label {
                text: "Online"
                color: "#00ff88"
                font.pixelSize: 12
            }
        }

        Item { Layout.fillWidth: true }

        Button { text: "🎤" }
        Button { text: "🔊" }
        Button { text: "⚙" }
    }
}
