import Quickshell
import Quickshell.Services.Notifications

import "bar"


Scope {
  id: root

  NotificationServer {
    id: notificationServer
    onNotification: notification => notification.tracked = true
  }
  
  Bar {
    notificationServerThing: notificationServer
  }
}
