//
//  GeneralFormatter.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 23/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public enum GeneralFormatter {
    case cpf
    case phone
    case cnpj
    case custom(formatter: CustomFormatter)

    public var formatter: CustomFormatter {
        switch self {
        case .cpf:
            return CPFFormatter()
        case .phone:
            return PhoneFormatter()
        case .cnpj:
            return CNPJFormatter()
        case .custom(let formatter):
            return formatter
        }
    }

    public func format(value: String?) -> String {
        guard let value = value else {
            return ""
        }

        return formatter.format(value: value)
    }

    public func formatTextField(_ textField: UITextField,
                                shouldChangeCharactersIn range: NSRange,
                                replacementString string: String) -> Bool {
        return formatter.shouldChangeCharacters(of: textField, inRange: range, typedText: string)
    }
}
