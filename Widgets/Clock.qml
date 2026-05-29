import QtQuick

import "../Services"

Column {
    spacing: 0

    Text {
        anchors.horizontalCenter: parent.horizontalCenter

        text: Time.time
        color: "#f6e9ee"
        font.pixelSize: 15
        font.bold: true
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter

        text: Time.date
        color: "#bdaeb5"
        font.pixelSize: 10
    }
}
