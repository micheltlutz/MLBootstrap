//
//  Formatter+Extension.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/10/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Foundation

public extension Formatter {
    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        if #available(iOS 11.0, *) {
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        } else {
            formatter.formatOptions = [.withInternetDateTime]
        }
        return formatter
    }()
    static let iso8601noFS = ISO8601DateFormatter()
}
