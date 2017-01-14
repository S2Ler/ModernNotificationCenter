# ModernNotificationCenter
[![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)](https://swift.org)
[![SPM Ready](https://img.shields.io/badge/SPM-ready-orange.svg)](https://swift.org/package-manager/)
[![Carthage-compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![codebeat badge](https://codebeat.co/badges/4245c8bb-a9a2-4b72-8354-139daca640a2)](https://codebeat.co/projects/github-com-diejmon-modernnotificationcenter)

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
