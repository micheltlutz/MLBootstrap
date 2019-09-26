//
//  CustomFormatter.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 23/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public protocol CustomFormatter {
    func format(value: String) -> String
    func formatForTextField(value: String) -> String
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool
}

extension CustomFormatter {
    //swiftlint:disable vertical_parameter_alignment
    public func shouldChangeCharacters(of textField: UITextField,
                                     inRange range: NSRange,
                                     typedText: String,
                                     maxLength: Int,
                                     isDigitsOnly: Bool = true) -> Bool {
        let currentText = NSString(string: textField.text ?? "")
        var result = String(currentText)

        if maxLength > range.location, maxLength >= (currentText.length + typedText.count) {
            result = formatForTextField(value: currentText.replacingCharacters(in: range, with: typedText))
        }

        textField.text = result
        textField.sendActions(for: .editingChanged)

        if typedText.isEmpty {
            if let newPosition = textField.position(from: textField.beginningOfDocument, offset: range.location) {
                textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
            }
        }

        return false
    }
}
