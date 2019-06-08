#if canImport(UIKit)
import UIKit
import ModernNotificationCenter

public struct KeyboardWillShowNotification: NotificationDescriptor {
  public let frameBegin: CGRect
  public let frameEnd: CGRect
  public let animationDuration: TimeInterval
  public let animationCurve: UIView.AnimationCurve

  public static var notificationName = Notification.Name.UIResponder.keyboardWillShowNotification
}

extension KeyboardWillShowNotification: ExpressibleByNotification {
  public init(_ notification: Notification) {
    let userInfo = notification.userInfo!
    frameBegin = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    frameEnd = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
    animationCurve = UIView.AnimationCurve(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue)!
  }
}

public struct KeyboardWillHideNotification: NotificationDescriptor {
  public let frameBegin: CGRect
  public let frameEnd: CGRect
  public let animationDuration: TimeInterval
  public let animationCurve: UIView.AnimationCurve

  public static var notificationName = Notification.Name.UIResponder.keyboardWillHideNotification
}

extension KeyboardWillHideNotification: ExpressibleByNotification {
  public init(_ notification: Notification) {
    let userInfo = notification.userInfo!
    frameBegin = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    frameEnd = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
    animationCurve = UIView.AnimationCurve(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue)!
  }
}

public struct KeyboardDidShowNotification: NotificationDescriptor {
  public let frameBegin: CGRect
  public let frameEnd: CGRect

  public static var notificationName = Notification.Name.UIResponder.keyboardDidShowNotification
}

extension KeyboardDidShowNotification: ExpressibleByNotification {
  public init(_ notification: Notification) {
    let userInfo = notification.userInfo!
    frameBegin = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    frameEnd = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
  }
}

public struct KeyboardDidHideNotification: NotificationDescriptor {
  public let frameBegin: CGRect
  public let frameEnd: CGRect

  public static var notificationName = Notification.Name.UIResponder.keyboardDidHideNotification
}

extension KeyboardDidHideNotification: ExpressibleByNotification {
  public init(_ notification: Notification) {
    let userInfo = notification.userInfo!
    frameBegin = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    frameEnd = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
  }
}

#endif
