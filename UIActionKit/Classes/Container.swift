//
//  Container.swift
//  UIActionKit
//
//  Created by HyanCat on 05/02/2018.
//

import Foundation

/// A simple container, hold all the actions.
class Container {

    static let shared = Container()

    private init() {}

    private var _actions: [AnyHashable: Action] = [:]

    func save(action: Action, for target: AnyHashable) {
        _actions[target] = action
    }

    func action(for target: AnyHashable) -> Action? {
        return _actions[target]
    }

    func destroy(for target: AnyHashable) {
        _actions.removeValue(forKey: target)
    }

}
