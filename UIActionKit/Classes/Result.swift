//
//  Result.swift
//  UIActionKit
//
//  Created by HyanCat on 05/02/2018.
//

import Foundation

/// Define the result of an action
public class Result: NSObject {
    /// Is the action continuous.
    /// If true, the action will be handled by next responder.
    /// Otherwise, the action will be ended handling.
    public let isContinuous: Bool

    private init(isContinuous: Bool = false) {
        self.isContinuous = isContinuous
    }

    /// This is a continuous result.
    public static let `continue`: Result = Result(isContinuous: true)
    /// This result make the action's end.
    public static let end: Result = Result(isContinuous: false)
}
