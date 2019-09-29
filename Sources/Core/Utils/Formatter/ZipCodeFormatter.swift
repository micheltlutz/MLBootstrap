//
//  ZipCodeFormatter.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 28/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public struct ZipCodeFormatter: CustomFormatter {
    public func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)

        if formattedString.length > 5 {
            formattedString.insert("-", at: 5)
        }

        return formattedString as String
    }

    public func formatForTextField(value: String) -> String {
        return format(value: value)
    }

    public func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 9)
    }
}
