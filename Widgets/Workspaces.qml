pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.Themes

Rectangle {
    id: root

    readonly property color occupiedColor: "#92707b"
    readonly property color activeColor: Default.accent
    readonly property color emptyColor: "#4a3e45"
    readonly property color textColor: "#f5e8eb"

    implicitWidth: row.implicitWidth + 12
    implicitHeight: 32

    radius: 10
    color: "#332b30"

    RowLayout {
        id: row

        anchors.centerIn: parent
        spacing: 5

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                id: workspaceButton

                required property HyprlandWorkspace modelData

                readonly property int workspaceId: modelData.id
                readonly property bool active: modelData.focused
                readonly property bool occupied: modelData.toplevels.values.length > 0

                Layout.preferredWidth: active ? 32 : 24
                Layout.preferredHeight: 24

                radius: 7
                color: active ? root.activeColor : occupied ? root.occupiedColor : root.emptyColor

                Behavior on Layout.preferredWidth {
                    NumberAnimation {
                        duration: 120
                    }
                }

                Text {
                    anchors.centerIn: parent

                    text: workspaceButton.workspaceId
                    color: root.textColor
                    font.pixelSize: 12
                    font.bold: workspaceButton.active
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor

                    onClicked: workspaceButton.modelData.activate()
                }
            }
        }
    }
}
