import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Variants {
    model: Quickshell.screens

    PanelWindow {
        required property var modelData
        screen: modelData

        property bool commandMode: false

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 36
        color: "#1e1e2e"

        Workspaces {}

        Clock {
            anchors.centerIn: parent
        }
        Item {
            Layout.fillWidth: true
        }

        RowLayout {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            spacing: 8

            Keyboard {}
            Battery {}
        }

        //     Unlock {
        //         anchors {
        //             left: parent.left
        //             verticalCenter: parent.verticalCenter
        //             leftMargin: 10
        //         }
        //
        //         text: "Unlock"
        //         backgroundColor: "#a6e3a1"
        //         textColor: "#1e1e2e"
        //     }
        //
        //     // Rectangle {
        //     //   anchors.fill: parent
        //     //   color: bar.commandMode ? "#444444" : "#222222"
        //     //
        //     //   Text {
        //     //     anchors.centerIn: parent
        //     //     color: "white"
        //     //     text: bar.commandMode ? "Press a command key..." : "My bar"
        //     //   }
        //     // }
        // }
        //
        // GlobalShortcut {
        //     name: "bar-enter-command-mode"
        //
        //     onPressed: {
        //         bar.commandMode = true;
        //         console.log("Command mode entered");
        //     }
        // }
        //
        // GlobalShortcut {
        //     name: "bar-command-a"
        //
        //     onPressed: {
        //         console.log("Received A");
        //         bar.commandMode = false;
        //         Hyprland.dispatch("submap reset");
        //     }
        // }
        //
        // GlobalShortcut {
        //     name: "bar-command-b"
        //
        //     onPressed: {
        //         console.log("Received B");
        //         bar.commandMode = false;
        //         Hyprland.dispatch("submap reset");
        //     }
        // }
        //
        // GlobalShortcut {
        //     name: "bar-command-cancel"
        //
        //     onPressed: {
        //         console.log("Command mode cancelled");
        //         bar.commandMode = false;
        //         Hyprland.dispatch("submap reset");
        //     }
        // }
        //
        // GlobalShortcut {
        //     name: "bar-enter-command-mode"
        //
        //     onPressed: {
        //         bar.commandMode = true;
        //     }
    }
}
