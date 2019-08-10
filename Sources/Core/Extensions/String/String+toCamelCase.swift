//
//  String+toCamelCase.swift
//  Cingulo
//
//  Created by Michel Anderson Lutz Teixeira on 17/06/2018.
//  Copyright © 2018 Codigo da Mente Edicao E Comercio De Livros E Testes. All rights reserved.
//

import Foundation
extension String {
    public func toCamelCase() -> String {
        return self.replacingOccurrences(of: "([A-Z])",
                                         with: " $1",
                                         options: .regularExpression,
                                         range: self.range(of: self))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }
}
