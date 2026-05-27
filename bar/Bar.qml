import Quickshell
import Quickshell.Services.Notifications
import QtQuick

import "../notifications"
import ".."

Scope {
  id: root

  required property NotificationServer notificationServerThing

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: panelBar
      
      required property var modelData
      screen: modelData

      color: Colors.surface
      implicitHeight: 30

      anchors {
        top: true
        left: true
        right: true
      }

      Text {
        anchors.verticalCenterOffset: -1
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        text: Clock.time
        color: Colors.primary
        font.family: Config.font
        font.pointSize: 10
      }

      Text {
        anchors.verticalCenterOffset: -1
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: ""
        color: Colors.primary
        font.family: Config.font
        font.pointSize: 10
      }

      Text {
        anchors.verticalCenterOffset: -1
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        text: Battery.battery
        color: Colors.primary
        font.family: Config.font
        font.pointSize: 10
      }

      Notifications {
        panelWindow: panelBar
        notificationServer: notificationServerThing
        isVisible: true
      }
    }
  }
}
