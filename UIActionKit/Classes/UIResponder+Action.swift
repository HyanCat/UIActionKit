//
//  UIResponder+Action.swift
//  UIActionKit
//
//  Created by HyanCat on 05/02/2018.
//

import UIKit

// MARK: - Extension UIResponder to dispatch actions.
extension UIResponder {

    /// Dispatch an action.
    ///
    /// - Parameters:
    ///   - action: The action to be dispatched.
    ///   - queue: Which queue will it be running, and on main queue by defaults.
    public func dispatch(action: Action, on queue: DispatchQueue = .main) {
        queue.async {
            self.dispatch(action: action)
        }
    }

    /// Dispatch an action
    ///
    /// - Parameter action: The action to be dispatched.
    private func dispatch(action: Action) {
        guard action.name.name.count > 0 else { return }

        let specifiedSelector = Selector("handle" + action.name.name.uppercasedFirst + ":")
        let commonSelector = #selector(handleAction(_:))
        let selector: Selector = self.responds(to: specifiedSelector) ? specifiedSelector : commonSelector
        if self.responds(to: selector) {
            let unmanagedResult = self.perform(selector, with: action)
            guard let result = unmanagedResult?.takeUnretainedValue() as? Result, result.isContinuous else {
                return
            }
        }

        dispatchToNext(action: action)
    }

    /// Dispatch an action to it's next responder.
    ///
    /// - Parameter action: The action to be dispatched.
    private func dispatchToNext(action: Action) {
        if let nextResponder = self.nextActionResponder {
            nextResponder.dispatch(action: action)
        }
    }

    /// The default handle method. Any subclass of UIResponder can override this method, but not necessary.
    ///
    /// - Parameter action: The action will be handled.
    /// - Returns: The result of the action.
    @objc
    open func handleAction(_ action: Action) -> Result {
        return Result.continue
    }
}

extension UIResponder {
    /// Define our responder chain, which extend the UI responder chain.
    var nextActionResponder: UIResponder? {
        if self is UIViewController {
            let `self` = self as! UIViewController
            if let navigation = self.navigationController, let index = navigation.viewControllers.firstIndex(of: self) {
                return index > 1 ? navigation.viewControllers[index - 1] : navigation
            }
            if let parent = self.parent {
                return parent
            }
        }
        return self.next
    }
}
