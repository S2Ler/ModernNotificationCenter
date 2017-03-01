import Foundation
import ModernNotificationCenter

public struct KeyboardWillShowNotification: NotificationDescriptor {
  public let frameBegin: CGRect
  public let frameEnd: CGRect
  public let animationDuration: TimeInterval
  public let animationCurve: UIViewAnimationCurve

  public static var notificationName = Notification.Name.UIKeyboardWillShow
}

extension KeyboardWillShowNotification: ExpressibleByNotification {
  public init(_ notification: Notification) {
    let userInfo = notification.userInfo!
    frameBegin = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    frameEnd = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
    animationCurve = UIViewAnimationCurve(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue)!
  }
}

public struct KeyboardWillHideNotification: NotificationDescriptor {
  public let frameBegin: CGRect
  public let frameEnd: CGRect
  public let animationDuration: TimeInterval
  public let animationCurve: UIViewAnimationCurve

  public static var notificationName = Notification.Name.UIKeyboardWillHide
}

extension KeyboardWillHideNotification: ExpressibleByNotification {
  public init(_ notification: Notification) {
    let userInfo = notification.userInfo!
    frameBegin = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    frameEnd = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
    animationCurve = UIViewAnimationCurve(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue)!
  }
}

public struct KeyboardDidShowNotification: NotificationDescriptor {
  public let frameBegin: CGRect
  public let frameEnd: CGRect

  public static var notificationName = Notification.Name.UIKeyboardDidShow
}

extension KeyboardDidShowNotification: ExpressibleByNotification {
  public init(_ notification: Notification) {
    let userInfo = notification.userInfo!
    frameBegin = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    frameEnd = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
  }
}

public struct KeyboardDidHideNotification: NotificationDescriptor {
  public let frameBegin: CGRect
  public let frameEnd: CGRect

  public static var notificationName = Notification.Name.UIKeyboardDidHide
}

extension KeyboardDidHideNotification: ExpressibleByNotification {
  public init(_ notification: Notification) {
    let userInfo = notification.userInfo!
    frameBegin = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    frameEnd = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
  }
}
