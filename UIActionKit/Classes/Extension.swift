//
//  Extension.swift
//  UIActionKit
//
//  Created by HyanCat on 05/02/2018.
//

import Foundation

// MARK: - String empty
extension String {
    /// Simplly check if a string is empty.
    var isEmpty: Bool {
        return self.count == 0
    }
    /// Simplly check if a string is not empty.
    var isNotEmpty: Bool {
        return self.count > 0
    }
}

/// Simplly check if an optional string is empty
///
/// - Parameter string: the string value.
/// - Returns: Boolean value if it is empty.
func isEmpty(string: String?) -> Bool {
    return string == nil || string!.isEmpty
}

/// Simplly check if an optional string is not empty
///
/// - Parameter string: the string value.
/// - Returns: Boolean value if it is not empty.
func isNotEmpty(string: String?) -> Bool {
    return string != nil && string!.isNotEmpty
}

extension String {
    /// Get a string that the first letter is uppercased.
    var uppercasedFirst: String {
        return String(self[startIndex]).uppercased() + String(self[index(after: startIndex)..<endIndex])
    }
}
