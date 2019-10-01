//
//  String+Extensions.swift
//  Cingulo
//
//  Created by Cíngulo on 18/06/2018.
//  Copyright © 2018 Codigo da Mente Edicao E Comercio De Livros E Testes. All rights reserved.
//

import UIKit

extension String {
    public func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

    public var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars
            .compactMap { pattern ~= $0 ? Character($0) : nil })
    }

    public var stringByRemovingWhitespaces: String {
        let components = self.components(separatedBy: .whitespaces)
        return components.joined(separator: "")
    }

    public var withoutCharactersAndSpace: String {
        var text = self.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: "(", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: "+", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: ":", with: "", options: .literal, range: nil)
        text = text.trimmingCharacters(in: .whitespaces)
        text = text.stringByRemovingWhitespaces
        return text
    }

    public var withoutSpecialCharacters: String {
        var text = self.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: "(", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: "+", with: "", options: .literal, range: nil)
        text = text.replacingOccurrences(of: ":", with: "", options: .literal, range: nil)
        return text
    }
    //swiftlint:disable line_length
    public func withoutSpecialCharacters(andSpace: Bool = false) -> String {
        var possibleCharacters = Set("aáâãbcdeéêfghiíjklmnoóôõpqrstuúüvwxyzAÁÂÃBCDEÉÊFGHIÍJKLKMNOÓÔÕPQRSTUÚÜVWXYZ1234567890")

        if !andSpace {
            possibleCharacters.insert(" ")
        }

        return String(self.filter { possibleCharacters.contains($0) })
    }

    public func removeDDI() -> String {
        let phone = self
        if phone.count == 13 {
            let phoneWithoutDDI = String(phone.dropFirst(2))

            return phoneWithoutDDI
        } else {
            return phone
        }
    }

    public var digitsOnly: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    public var hasOnlyDigits: Bool {
        return rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }

    public var hasOnlyLetters: Bool {
        return rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    }

    public var lettersOnly: Bool {
        let onlyLetters: (Character) -> Bool = { ("a"..."z" ~= $0) || ("A"..."Z" ~= $0) }
        return allSatisfy(onlyLetters)
    }

    public func trimmingTrailingSpaces() -> String {
        var trim = self
        while trim.hasSuffix(" ") {
            trim = "" + trim.dropLast()
        }
        return trim
    }

    public mutating func trimmedTrailingSpaces() {
        self = self.trimmingTrailingSpaces()
    }

    /**
     String Extension: This function calculate the height of a  label based on width and font
     */
    public func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)
        return ceil(boundingBox.height)
    }
}
