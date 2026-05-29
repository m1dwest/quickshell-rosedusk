import QtQuick

Rectangle {
  id: root

  property string text: "Unlock"
  property color backgroundColor: "#a6e3a1"
  property color textColor: "#1e1e2e"

  implicitWidth: label.implicitWidth + 20
  implicitHeight: label.implicitHeight + 10

  radius: 8
  color: backgroundColor

  Text {
    id: label

    anchors.centerIn: parent

    text: root.text
    color: root.textColor

    font.pixelSize: 14
    font.bold: true
  }
}
