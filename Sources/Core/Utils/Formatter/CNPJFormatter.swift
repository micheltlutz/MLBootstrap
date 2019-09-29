//
//  CNPJFormatter.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 28/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public struct CNPJFormatter: CustomFormatter {
    public var maxLength: Int = 18

    public func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)

        if formattedString.length > 2 {
            formattedString.insert(".", at: 2)
        }
        if formattedString.length > 6 {
            formattedString.insert(".", at: 6)
        }
        if formattedString.length > 10 {
            formattedString.insert("/", at: 10)
        }
        if formattedString.length > 15 {
            formattedString.insert("-", at: 15)
        }

        return formattedString as String
    }

    public func formatForTextField(value: String) -> String {
        return format(value: value)
    }

    public func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: maxLength)
    }
}
