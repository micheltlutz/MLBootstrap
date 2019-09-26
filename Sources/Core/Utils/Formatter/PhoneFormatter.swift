//
//  PhoneFormatter.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 23/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public struct PhoneFormatter: CustomFormatter {
    public var maxLength: Int = 15
    //swiftlint:disable function_body_length
    public func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)

        if formattedString.hasPrefix("0") {
            formattedString.deleteCharacters(in: NSRange(location: 0, length: 1))
        }

        switch formattedString.length {
        case 13:
            if !formattedString.hasPrefix("55") {
                return formattedString as String
            }

            formattedString.deleteCharacters(in: NSRange(location: 0, length: 2))
            formattedString.insert("(", at: 0)
            formattedString.insert(")", at: 3)
            formattedString.insert(" ", at: 4)
            formattedString.insert("-", at: 10)

            return formattedString as String
        case 12:
            if !formattedString.hasPrefix("55") {
                return formattedString as String
            }

            formattedString.deleteCharacters(in: NSRange(location: 0, length: 2))
            formattedString.insert("(", at: 0)
            formattedString.insert(")", at: 3)
            formattedString.insert(" ", at: 4)
            formattedString.insert("-", at: 9)

            return formattedString as String
        case 11:
            formattedString.insert("(", at: 0)
            formattedString.insert(")", at: 3)
            formattedString.insert(" ", at: 4)
            formattedString.insert("-", at: 10)

            return formattedString as String
        case 10:
            formattedString.insert("(", at: 0)
            formattedString.insert(")", at: 3)
            formattedString.insert(" ", at: 4)
            formattedString.insert("-", at: 9)

            return formattedString as String
        case 9:
            formattedString.insert("-", at: 5)

            return formattedString as String
        case 8:
            formattedString.insert("-", at: 4)

            return formattedString as String
        default:
            return formattedString as String
        }
    }

    public func formatForTextField(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)

        if formattedString.hasPrefix("0") {
            return ""
        }

        if formattedString.length > 0 {
            formattedString.insert("(", at: 0)
        }
        if formattedString.length > 3 {
            formattedString.insert(")", at: 3)
        }
        if formattedString.length > 4 {
            formattedString.insert(" ", at: 4)
        }
        if formattedString.length == 14 {
            formattedString.insert("-", at: 10)
        } else if formattedString.length > 9 {
            formattedString.insert("-", at: 9)
        }

        return formattedString as String
    }

    public func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        if typedText == "" || CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: typedText)) {
            let currentPhone = textField.text ?? ""

            guard let rangeExpression = Range(range, in: currentPhone) else {
                return false
            }

            if currentPhone.count < maxLength || currentPhone.count >= maxLength && typedText == "" {
                let newPhone = currentPhone.replacingCharacters(in: rangeExpression, with: typedText)
                let unmaskedPhone = newPhone.withoutSpecialCharacters(andSpace: true).trimmingTrailingSpaces()

                let maskedPhone = formatForTextField(value: unmaskedPhone)

                textField.text = maskedPhone

                return false
            }
        }

        return false
    }
}
