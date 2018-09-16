import Foundation

public protocol NotificationDescriptor {
  static var notificationName: Notification.Name { get }
}

public protocol ExpressibleByNotification {
  init(_ notification: Notification)
}

public class Token {
  private let token: NSObjectProtocol
  private let center: NotificationCenter

  fileprivate init(token: NSObjectProtocol, center: NotificationCenter) {
    self.token = token
    self.center = center
  }

  public func add(to array: inout [Token]) {
    array.append(self)
  }

  deinit {
    center.removeObserver(token)
  }
}

public extension NotificationCenter {
  private static let userInfoNoteKey = "com.diejmon.notification_center.note.key"

  public func addObserver<Note: NotificationDescriptor & ExpressibleByNotification>(for object: Any? = nil,
                   queue: OperationQueue? = nil,
                   using block: @escaping (Note) -> ()) -> Token {
    let token = addObserver(forName: Note.notificationName, object: object, queue: queue) { (plainNotification) in
      if let customNote = plainNotification.userInfo?[NotificationCenter.userInfoNoteKey] as? Note {
        block(customNote)
      } else {
        block(Note(plainNotification))
      }
    }

    return Token(token: token, center: self)
  }

  public func addObserver<Note: NotificationDescriptor>(for object: Any? = nil,
                   queue: OperationQueue? = nil,
                   using block: @escaping (Note) -> ()) -> Token {
    let token = addObserver(forName: Note.notificationName, object: object, queue: queue) { (plainNotification) in
      if let customNote = plainNotification.userInfo?[NotificationCenter.userInfoNoteKey] as? Note {
        block(customNote)
      } else {
        preconditionFailure("Wrong API usage. Use `func post<Note: NotificationDescriptor>(notification: Note, object: Any?)` method to post notifications which are subscribed with this method")
      }
    }

    return Token(token: token, center: self)
  }

  public func post<Note: NotificationDescriptor>(notification: Note, object: Any? = nil) {
    post(name: Note.notificationName, object: object, userInfo: [NotificationCenter.userInfoNoteKey: notification])
  }
}
