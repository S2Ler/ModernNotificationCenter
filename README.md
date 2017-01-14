# ModernNotificationCenter
A lightweigth wrapper around Swift Foundation NotificationCenter, which doesn't require playing with stringly-typed API. 

# Usage

## Custom notifications

```swift
// Create a type safe notification class or struct which conforms to NotificationDescriptor

struct UserNotification: NotificationDescriptor {
  let data: String
  static var notificationName = Notification.Name(rawValue: "UserNotification")
}

// Subscribe to the notification

/// token is an opaque class which is used to unsubscribe from the notification. When the token gets deallocated, the observer is removed from NotificationCenter
let token = NotificationCenter.default.addObserver { (notification: UserNotification) in
  // Use UserNotification
}

// Post this notification 

NotificationCenter.default.post(notification: UserNotification(data: expectedData))

// That's it!
```

## Working with system notifications or notifications you don't control

```swift
// Create a type safe notification class or struct which conforms to NotificationDescriptor

struct SystemNotification: NotificationDescriptor {
  static var notificationName = Notification.Name(rawValue: "SystemNotification")
}

// Add conformance to ExpressibleByNotification
extension SystemNotification: ExpressibleByNotification {
  init(_ notification: Notification) {
    //
  }
}

// Subscribe to this notification

/// token is an opaque class which is used to unsubscribe from the notification. When the token gets deallocated, the observer is removed from NotificationCenter
let token = NotificationCenter.default.addObserver { (notification: SystemNotification) in
  // Use SystemNotification here
}

// That's it!
```

# Credits 
Special thanks to [objc.io swift talk](https://talk.objc.io/episodes/S01E28-typed-notifications-part-2) for the idea. 
