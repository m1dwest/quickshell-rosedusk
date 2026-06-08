import QtQuick

import qs.Themes
import "../Services"

Rectangle {
    id: root

    readonly property color backgroundColor: Socrates.active
    readonly property color timeTextColor: "#f6e9ee"
    readonly property color timeDateColor: "#bdaeb5"

    width: 200
    height: 20
    radius: 2

    color: backgroundColor

    Row {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: Time.time
            color: root.timeTextColor
            font.pixelSize: 15
            font.family: Default.mainFont.family
            font.bold: true
        }

        Text {
            text: Time.date
            color: root.timeDateColor
            font.pixelSize: 15
            font.family: Default.mainFont.family
            font.bold: true
        }
    }
}
