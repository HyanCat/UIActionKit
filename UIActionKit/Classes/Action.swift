//
//  Action.swift
//  UIActionKit
//
//  Created by HyanCat on 05/02/2018.
//

import UIKit

/// Define the action class.
/// It must be subclass of NSObject for it will use the Objective-C characteristic.
public class Action: NSObject {
    /// The name (also an identifier) of an action, which different from others.
    public let name: ActionName
    /// The object of an action, usually the sender of the action.
    public var object: Any?
    /// The additional infomation for the action.
    public var userInfo: [String: Any]?

    internal var gesture: UIGestureRecognizer?

    public init(name: ActionName, object: Any? = nil, userInfo: [String: Any]? = nil) {
        self.name = name
        self.object = object
        self.userInfo = userInfo
    }
}
