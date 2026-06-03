pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property color accent: "#a62145"
    readonly property color background: "#191724"

    readonly property font mainFont: Qt.font({
        family: "Iosevka Nerd Font Mono",
        pointSize: 12
    })
}
