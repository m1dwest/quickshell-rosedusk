pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property color active: "#996633"
    readonly property color activeDarker: "#663300"
    readonly property color inactive: "#424153"
    readonly property color inactiveLighter: "#999999"
    readonly property color background: "#000000"
    readonly property color text: "#f6e9ee"

    readonly property font mainFont: Qt.font({
        family: "Iosevka Nerd Font Mono",
        pointSize: 12
    })
}
