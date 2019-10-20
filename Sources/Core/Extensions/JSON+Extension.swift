//
//  JSON+Extension.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/10/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Foundation

public extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options, timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) {
        self.init()
        self.formatOptions = formatOptions
        self.timeZone = timeZone
    }
}

public extension JSONEncoder.DateEncodingStrategy {
    static let customISO8601 = custom {
        var container = $1.singleValueContainer()
        try container.encode(Formatter.iso8601.string(from: $0))
    }
}

public extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601 = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = Formatter.iso8601.date(from: string) ?? Formatter.iso8601noFS.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}
