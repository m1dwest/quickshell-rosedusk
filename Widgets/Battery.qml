import QtQuick
import Quickshell.Services.UPower

Rectangle {
    id: root

    readonly property var battery: UPower.displayDevice
    readonly property int percentage: Math.round(battery.percentage * 100)

    visible: battery.ready && battery.isLaptopBattery

    implicitWidth: label.implicitWidth + 16
    implicitHeight: 30

    radius: 10
    color: "#332b30"

    Text {
        id: label

        anchors.centerIn: parent

        text: (UPower.onBattery ? "" : "⚡ ") + root.percentage + "%"
        color: "#f5e8eb"
        font.pixelSize: 13
    }
}
