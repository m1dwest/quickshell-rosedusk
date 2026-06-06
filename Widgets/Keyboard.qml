import QtQuick
import Quickshell.Io
import Quickshell.Hyprland

import qs.Themes

Rectangle {
    id: root

    property string layout: "--"

    implicitWidth: label.implicitWidth + 16
    implicitHeight: 20

    radius: 2
    color: mouseArea.containsMouse ? Socrates.activeDarker : Socrates.active

    function shortLayout(name) {
        if (name.startsWith("English"))
            return "EN";
        if (name.startsWith("Russian"))
            return "RU";
        if (name.startsWith("Japanese"))
            return "JP";

        return name.substring(0, 2).toUpperCase();
    }

    Text {
        id: label

        anchors.centerIn: parent

        text: root.layout
        color: "#f5e8eb"
        font.pixelSize: 13
        font.weight: Font.Medium
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: switchLayout.running = true
    }

    Process {
        id: readLayout

        command: ["hyprctl", "-j", "devices"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const devices = JSON.parse(text);
                const keyboard = devices.keyboards.find(keyboard => keyboard.main) ?? devices.keyboards[0];

                if (keyboard)
                    root.layout = root.shortLayout(keyboard.active_keymap);
            }
        }
    }

    Process {
        id: switchLayout

        command: ["hyprctl", "switchxkblayout", "current", "next"]

        onExited: readLayout.running = true
    }

    Connections {
        target: Hyprland

        function onRawEvent(event) {
            if (event.name === "activelayout")
                readLayout.running = true;
        }
    }
}
