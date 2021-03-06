//
//  NoRuleFormatter.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 28/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public struct NoRuleFormatter: CustomFormatter {
    public var maxLength: Int

    public init(maxLength: Int) {
        self.maxLength = maxLength
    }

    public func format(value: String) -> String {
        return value
    }

    public func formatForTextField(value: String) -> String {
        return format(value: value)
    }

    public func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: maxLength)
    }
}
