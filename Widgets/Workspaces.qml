pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.Themes

Item {
    id: root

    readonly property color activeColor: Socrates.active
    readonly property color occupiedColor: Socrates.inactive
    readonly property color emptyColor: "transparent"
    readonly property color textColor: Socrates.text

    property int leftPadding: 0
    property int rightPadding: 0
    property int topPadding: 0
    property int bottomPadding: 0

    implicitWidth: row.implicitWidth + leftPadding + rightPadding

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
                readonly property string workspaceName: modelData.name
                readonly property bool active: Hyprland.focusedWorkspace?.id === modelData.id

                readonly property bool occupied: modelData.toplevels.values.length > 0

                Layout.preferredWidth: active ? 38 : 20
                Layout.preferredHeight: 20

                color: active ? root.activeColor : occupied ? root.occupiedColor : root.emptyColor
                // color: active ? root.activeColor : root.emptyColor
                // color: root.emptyColor

                radius: 2

                Behavior on Layout.preferredWidth {
                    NumberAnimation {
                        duration: 120
                    }
                }

                Text {
                    anchors.centerIn: parent

                    text: workspaceButton.workspaceId
                    // text: active ? `[ ${workspaceButton.workspaceName} ]` : workspaceButton.workspaceId
                    color: root.textColor
                    font.family: Socrates.mainFont.family
                    font.pointSize: 8
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
