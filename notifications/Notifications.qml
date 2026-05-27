import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

import ".."

PopupWindow {
  id: notifications

  required property NotificationServer notificationServer
  required property PanelWindow panelWindow
  required property bool isVisible

  color: Colors.surface
  anchor.window: panelWindow
  anchor.rect.x: panelWindow.width - 500
  anchor.rect.y: panelWindow.height
  implicitWidth: 500
  implicitHeight: notificationColumn.height + 10
  visible: isVisible && notificationServer.trackedNotifications.values.length > 0

  ColumnLayout {
    id: notificationColumn
    spacing: 0

    Repeater {
      model: notificationServer.trackedNotifications.values

      Rectangle {
        required property Notification modelData
        
        color: Colors.surface_container
        width: 480
        height: 100

        Layout.leftMargin: 10
        Layout.topMargin: 10
  
        MouseArea {
          anchors.fill: parent
          onClicked: parent.modelData.dismiss()
        }

        Text {
          width: 490
          height: 90
          anchors.top: parent.top
          anchors.topMargin: 10
          anchors.left: parent.left
          anchors.leftMargin: 10
          color: Colors.primary
          font.family: Config.font
          font.pointSize: 12
          text: `${parent.modelData.appName} - ${parent.modelData.summary}\n\n${parent.modelData.body}`
        }
      }
    }
  }
}
