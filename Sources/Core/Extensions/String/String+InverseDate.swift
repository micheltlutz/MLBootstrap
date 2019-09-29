//
//  String+InverseDate.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 29/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Foundation

extension String {
    /**
        Inverse String Date from dd/MM/YYYY to YYYY/MM/dd
     */
    func dmyToymd(separator: Character = "/", newSeparator: Character = "-") -> String {
        let splitString = self.split(separator: separator)
        return "\(splitString[2])\(newSeparator)\(splitString[1])\(newSeparator)\(splitString[0])"
    }
    /**
       Inverse String Date from YYYY-MM-dd to dd/MM/YYYY
    */
    func ymdTodmy(separator: Character = "-", newSeparator: Character = "/") -> String {
        let splitString = self.split(separator: separator)
        return "\(splitString[2])\(newSeparator)\(splitString[1])\(newSeparator)\(splitString[0])"
    }
}
