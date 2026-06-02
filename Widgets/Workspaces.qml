pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.Themes

Item {
    id: root

    readonly property color activeColor: Default.accent
    readonly property color occupiedColor: "#92707b"
    readonly property color emptyColor: "transparent"
    readonly property color textColor: "#f5e8eb"

    property int leftPadding: 6
    property int rightPadding: 6
    property int topPadding: 0
    property int bottomPadding: 0

    implicitWidth: row.implicitWidth + leftPadding + rightPadding
    implicitHeight: 24

    RowLayout {
        id: row

        anchors.fill: parent
        anchors.leftMargin: root.leftPadding
        anchors.rightMargin: root.rightPadding
        anchors.topMargin: root.topPadding
        anchors.bottomMargin: root.bottomPadding

        spacing: 6

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                id: workspaceButton

                required property HyprlandWorkspace modelData

                readonly property int workspaceId: modelData.id
                readonly property bool active: Hyprland.focusedWorkspace?.id === modelData.id

                readonly property bool occupied: modelData.toplevels.values.length > 0

                // Layout.preferredWidth: active ? 36 : 20
                // Layout.preferredHeight: active ? 30 : 20
                Layout.preferredWidth: 36
                Layout.preferredHeight: 30
                // Layout.fillHeight: true

                // color: active ? root.activeColor : occupied ? root.occupiedColor : root.emptyColor
                color: active ? root.activeColor : root.emptyColor

                // radius: height / 2

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
