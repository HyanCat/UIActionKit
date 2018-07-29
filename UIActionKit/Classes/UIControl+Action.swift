//
//  UIControl+Action.swift
//  UIActionKit
//
//  Created by HyanCat on 05/02/2018.
//

import UIKit

/// This protocol defines a sender of an action.
public protocol ActionSender: class {
    /// How to register it's action.
    func registerAction()
    /// How to unregister it's action.
    func unregisterAction()
}

// MARK: - Define `UIView` is an ActionSender
extension UIView: ActionSender {
    public func registerAction() {
        if self is UIControl {
            /// So, if it is a UIControl, we can register it's action by using UIControl's `addTarget(...)` method.
            (self as! UIControl).addTarget(self, action: #selector(handleTouched(_:)), for: .touchUpInside)
        } else {
            /// Otherwise, we add a tap gesture on any view.
            self.isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapped(gesture:)))
            self.addGestureRecognizer(gesture)
        }
    }

    public func unregisterAction() {
        if self is UIControl {
            /// Also, unregister it's action by `removeTarget(...)`.
            (self as! UIControl).removeTarget(self, action: #selector(handleTouched(_:)), for: .touchUpInside)
        } else {
            /// Or, unregister it's action by removing tap gesture.
            if let gesture = self.action?.gesture {
                self.removeGestureRecognizer(gesture)
            } else if let gesture = self.gestureRecognizers?.first(where: { $0 is UITapGestureRecognizer }) {
                self.removeGestureRecognizer(gesture)
            }
        }
    }

    @objc
    private func handleTouched(_ sender: UIControl) {
        guard let action = action else { return }
        /// Here we call the dispatch method. Then it will cast the action as a responder.
        self.dispatch(action: action)
    }

    @objc
    private func handleTapped(gesture recognizer: UITapGestureRecognizer) {
        guard let action = action else { return }
        /// Firstly we put this gesture recognizer to action.
        /// Then, we call the dispatch method.
        /// It will cast the action as a responder.
        action.gesture = recognizer
        self.dispatch(action: action)
    }
}

// MARK: - Make `ActionSender` holding an action
extension ActionSender where Self: NSObject {
    /// Associate an `action` property for any `ActionSender` instance.
    /// Of course the instance must be a `NSObject`.
    public var action: Action? {
        get {
            return Container.shared.action(for: self)
        }
        set {
            guard newValue != action else { return }

            if newValue == nil {
                /// We destroy it when it provide a nil value.
                Container.shared.destroy(for: self)
            } else {
                Container.shared.save(action: newValue!, for: self)
            }

            /// Register action or not, depends on the action's name.
            if isNotEmpty(string: newValue?.name.name) {
                self.registerAction()
            } else {
                self.unregisterAction()
            }
        }
    }
}
