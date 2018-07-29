//
//  ActionName.swift
//  UIActionKit
//
//  Created by HyanCat on 2018/7/29.
//

import Foundation

/// Standardize an action name struct.
///
/// Usage:
/// ```swift
/// extension ActionName {
///     static let exampleName1: ActionName = ActionName("exampleName1")
/// }
/// ```
/// Then, we use `ActionName.exampleName1`.
public struct ActionName {
    public let name: String

    public init(_ name: String) {
        self.name = name
    }
}

extension ActionName: Equatable, Comparable {
    public static func == (lhs: ActionName, rhs: ActionName) -> Bool {
        return lhs.name == rhs.name
    }

    public static func < (lhs: ActionName, rhs: ActionName) -> Bool {
        return lhs.name < rhs.name
    }
}

extension ActionName: CustomStringConvertible {
    public var description: String {
        return "UIActionKit.ActionName(\(self.name))"
    }
}
