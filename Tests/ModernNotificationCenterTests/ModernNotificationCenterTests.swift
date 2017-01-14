import XCTest
import ModernNotificationCenter

struct SystemNotification: NotificationDescriptor, ExpressibleByNotification {
  static var notificationName = Notification.Name(rawValue: "SystemNotification")
  init(_ notification: Notification) {
    //
  }
}

struct UserNotification: NotificationDescriptor {
  let data: String
  static var notificationName = Notification.Name(rawValue: "UserNotification")
}


class ModernNotificationCenterTests: XCTestCase {
  var token: Token?

  func testNotCreatableByUserNotifications() {
    let notificationIntercepted = expectation(description: "notification intercepted (1)")
    token = NotificationCenter.default.addObserver { (notification: SystemNotification) in
      notificationIntercepted.fulfill()
    }
    NotificationCenter.default.post(name: SystemNotification.notificationName, object: nil, userInfo: nil)
    waitForExpectations(timeout: 0.01, handler: nil)
  }

  func testCreatableByUserNotifications() {
    let expectedData = "AData"
    let notificationIntercepted = expectation(description: "notification intercepted (2)")
    token = NotificationCenter.default.addObserver { (notification: UserNotification) in
      XCTAssertEqual(notification.data, expectedData)
      notificationIntercepted.fulfill()
    }
    NotificationCenter.default.post(notification: UserNotification(data: expectedData))
    waitForExpectations(timeout: 0.01, handler: nil)
  }

  /* TODO:
   - Test notifications tied to objects
   - Test notifications with custom queue callback
   */

  static var allTests : [(String, (ModernNotificationCenterTests) -> () throws -> Void)] {
    return [
      ("testNotCreatableByUserNotifications", testNotCreatableByUserNotifications),
      ("testCreatableByUserNotifications", testCreatableByUserNotifications),
    ]
  }
}
