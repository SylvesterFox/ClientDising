<Rectangle>
    <Column>
        <Text text: "Servers" font.bold: true font.pixelSize: 20/1.5 anchors.horizontalCenter: parent.horizontalCenter />
        <ListView id="serverList" width: parent.width height: 300>
            <ListView.model>
                ListModel {
                    ListElement { serverName: "Server 1" }
                    ListElement { serverName: "Server 2" }
                }
            </ListView.model>
            <ListView.delegate>
                Item {
                    width: parent.width
                    height: 50
                    Text {
                        text: serverName
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            </ListView.delegate>
        </ListView>
        <Text text: "Channels" font.bold: true font.pixelSize: 20/1.5 anchors.horizontalCenter: parent.horizontalCenter />
        <ListView id="channelList" width: parent.width height: 300>
            <ListView.model>
                ListModel {
                    ListElement { channelName: "Channel 1" }
                    ListElement { channelName: "Channel 2" }
                }
            </ListView.model>
            <ListView.delegate>
                Item {
                    width: parent.width
                    height: 50
                    Text {
                        text: channelName
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            </ListView.delegate>
        </ListView>
    </Column>
</Rectangle>