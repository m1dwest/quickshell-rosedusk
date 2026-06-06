import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import qs.Themes

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root

        required property var modelData
        screen: modelData

        property bool commandMode: false
        property int barHeight: 30
        property int underlineHeight: 0

        implicitHeight: barHeight + underlineHeight
        color: Socrates.background

        anchors {
            top: true
            left: true
            right: true
        }

        Item {
            anchors.fill: parent

            RowLayout {
                id: row

                anchors.right: parent.right
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                spacing: 8

                Item {
                    implicitWidth: 2
                }

                Workspaces {
                    Layout.fillHeight: true
                }

                Clock {
                    anchors.centerIn: parent
                }
                Item {
                    Layout.fillWidth: true
                }
                Keyboard {}
                Battery {}
                Item {
                    implicitWidth: 0
                }
            }

            // Rectangle {
            //     id: underline
            //
            //     color: Default.accent
            //     height: root.underlineHeight
            //
            //     anchors.left: parent.left
            //     anchors.right: parent.right
            //     anchors.bottom: parent.bottom
            // }
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
