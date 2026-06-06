import QtQuick

import qs.Themes
import "../Services"

Rectangle {
    readonly property color occupiedColor: Socrates.active

    width: 200
    height: 20
    radius: 2

    color: occupiedColor

    Row {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: Time.time
            color: "#f6e9ee"
            font.pixelSize: 15
            font.family: Default.mainFont.family
            font.bold: true
        }

        Text {
            text: Time.date
            color: "#bdaeb5"
            font.pixelSize: 15
            font.family: Default.mainFont.family
            font.bold: true
        }
    }
}
