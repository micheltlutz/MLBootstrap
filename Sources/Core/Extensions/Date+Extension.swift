//
//  Date+Extension.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/10/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Foundation

public extension Date {
    init(dateString: String) {
        if let date = Date.iso8601Formatter.date(from: dateString) {
            self = date
            return
        }

        let formatter = Date.dateFormatter
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = "dd/MM/yyyy - HH:mm"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = "dd/MM/yyyy"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = "dd/MM"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = "yyyy-MM-dd"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        self = Date()
    }

    init(dateString: String, timeZone: TimeZone?) {
        let formatter = Date.dateFormatter
        formatter.timeZone = timeZone

        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        self = Date()
    }

    static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        return formatter
    }()

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()

    /// Date string in the specified format from date
    ///
    /// - Returns: Date string
    func string(withFormat format: String) -> String {
        let dateFormatter = Date.dateFormatter
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: self)
        return dateString
    }

    ///
    ///
    /// - Returns: String containing greeting according to the hour of the day
    func greeting() -> String {
        var greeting = ""
        let date = Date()
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        if 0...11 ~= hour {
            greeting = "Bom dia"
        } else if 12...18 ~= hour {
            greeting = "Boa tarde"
        } else {
            greeting = "Boa noite"
        }
        return greeting
    }

    /// Create a Date object from a Epoch & Unix Timestamp in milliseconds
    ///
    /// - Parameter interval: The Int time interval
    /// - Returns: The Date object created from the timestamp
    func timeIntervalToDate(_ interval: Int) -> Date {
        let timeInterval = TimeInterval(interval)
        return Date(timeIntervalSince1970: timeInterval / 1000)
    }
}
