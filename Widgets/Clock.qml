import QtQuick

import "../Services"

Item {
    width: 200
    height: 30

    Row {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: Time.time
            color: "#f6e9ee"
            font.pixelSize: 15
            font.family: Default.mainFont.family
        }

        Text {
            text: Time.date
            color: "#bdaeb5"
            font.pixelSize: 15
            font.family: Default.mainFont.family
        }
    }
}
