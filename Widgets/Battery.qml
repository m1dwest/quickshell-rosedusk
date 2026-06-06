import QtQuick
import Quickshell.Services.UPower

import qs.Themes

Rectangle {
    id: root

    readonly property var battery: UPower.displayDevice
    readonly property int percentage: Math.round(battery.percentage * 100)

    visible: battery.ready && battery.isLaptopBattery

    implicitWidth: label.implicitWidth + 16
    implicitHeight: 20

    radius: 2
    color: Socrates.active

    Text {
        id: label

        anchors.centerIn: parent

        text: (UPower.onBattery ? "" : "⚡ ") + root.percentage + "%"
        color: "#f5e8eb"
        font.pixelSize: 13
    }
}
