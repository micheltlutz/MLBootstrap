//
//  DateUtils.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 06/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Foundation

public struct DateUtils {
    public static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = RuntimeUtils.defaultTimeZone()
        formatter.locale = RuntimeUtils.defaultLocale()
        formatter.isLenient = true
        return formatter
    }()

    public static func dateNow(with dateFormat: String) -> String {
        let date = Date()
        let formatter = DateUtils.formatter
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }

    public static func dateNow() -> String {
        let date = Date()
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
//    static let weekDays = [i18n.DaysWeek.sunday.text, i18n.DaysWeek.monday.text, i18n.DaysWeek.tuesday.text,
//                           i18n.DaysWeek.wednesday.text, i18n.DaysWeek.thursday.text, i18n.DaysWeek.friday.text,
//                           i18n.DaysWeek.saturday.text]
//
//    public static func arrayWeekDaysChar() -> [Character] {
//        var arrayLetters: [Character] = []
//        for weekday in DateUtils.weekDays {
//            arrayLetters.append(weekday[0])
//        }
//        return arrayLetters
//    }
    // swiftlint:disable large_tuple
    public static func dayTimeNow() -> (day: Int, hour: Int, minutes: Int) {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return (day: day, hour: hour, minutes: minutes)
    }

    public static func formatterDateForLanguage() -> DateFormatter {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "EEEE, dd 'de' MMMM"
//        switch RuntimeUtils.languageISO() {
//        case "pt-BR":
//            formatter.dateFormat = "EEEE, dd 'de' MMMM"
//        default:
//            formatter.dateFormat = "EEEE, MMMM dd"
//        }
        return formatter
    }

    public static func formatterSlashDateForLanguage() -> DateFormatter {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "dd/MM/YYYY"
//        switch RuntimeUtils.languageISO() {
//        case "pt-BR":
//            formatter.dateFormat = "dd/MM/YYYY"
//        default:
//            formatter.dateFormat = "YYYY/dd/MM"
//        }
        return formatter
    }

    public static func stringDate(from date: Date) -> String {
        let formatter = DateUtils.formatterDateForLanguage()
        return formatter.string(from: date)
    }

    public static func stringDate(from stringDate: String) -> String {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd"
        let newDate = formatter.date(from: stringDate)
        let formatterIso = DateUtils.formatterDateForLanguage()
        return formatterIso.string(from: newDate!)
    }

    public static func stringDateTimeStemp(from stringDate: String) -> String? {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSxxxxx"
        guard let newDate = formatter.date(from: stringDate) else { return nil }
        let newFormatter = DateUtils.formatterSlashDateForLanguage()
        return newFormatter.string(from: newDate)
    }

    public static func timeStempToMonthYear(from stringDate: String) -> String? {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSxxxxx"
        guard let newDate = formatter.date(from: stringDate) else { return nil }
        let newFormatter = DateUtils.monthYear(date: newDate)
        return newFormatter
    }

    public static func date(from stringDate: String) -> Date {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: stringDate)!
    }

    public static func stringDateForApi(from date: Date) -> String {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }

    public static func getMonthYear(from date: Date) -> (month: Int, year: Int) {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        return (month: month, year: year)
    }

    public static func countDaysMonth(year: Int, month: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }

    public static func getArrayDaysMonth(year: Int, month: Int) -> [String] {
        let numDays = DateUtils.countDaysMonth(year: year, month: month)
        var arrayDays: [String] = []
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-M-d"
        for day in 1...numDays {
            if let dateIn = formatter.date(from: "\(year)-\(month)-\(day)") {
                arrayDays.append(DateUtils.stringDateForApi(from: dateIn))
            }
        }
        return arrayDays
    }

    public static func lowerThan(date1: String, date2: String) -> Bool {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd"
        if let newDate1 = formatter.date(from: date1), let newDate2 = formatter.date(from: date2) {
            return newDate1 < newDate2
        }
        return false
    }

    public static func greaterThan(date1: String, date2: String) -> Bool {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd"
        if let newDate1 = formatter.date(from: date1), let newDate2 = formatter.date(from: date2) {
            return newDate1 > newDate2
        }
        return false
    }

    public static func generateDates(startDate: Date?, addbyUnit: Calendar.Component, value: Int) -> [Date] {
        var dates = [Date]()
        var date = startDate!
        let endDate = Calendar.current.date(byAdding: addbyUnit, value: value, to: date)!
        while date < endDate {
            date = Calendar.current.date(byAdding: addbyUnit, value: 1, to: date)!
            dates.append(date)
        }
        return dates
    }
    // swiftlint:disable identifier_name
    public static func timeLapsed(from: Date, to: Date, calendarComponent: Calendar.Component) -> DateComponents {
        let passed = Calendar.current.dateComponents([calendarComponent], from: from, to: to)
        return passed
    }

    public static func monthYear(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM\nYY"
        formatter.timeZone = RuntimeUtils.defaultTimeZone()
        formatter.locale = RuntimeUtils.defaultLocale()
        if let newDate = formatter.date(from: date) {
            return formatter.string(from: newDate)
        }
        return ""
    }

    public static func monthYear(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM\nYY"
        formatter.timeZone = RuntimeUtils.defaultTimeZone()
        formatter.locale = RuntimeUtils.defaultLocale()
        return formatter.string(from: date)
    }

    public static func getDay(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "2018-09-24"
        formatter.timeZone = RuntimeUtils.defaultTimeZone()
        formatter.locale = RuntimeUtils.defaultLocale()
        return formatter.string(from: date)
    }

    public static func getDay(from date: String) -> String {
        let formatter = DateUtils.formatter
        formatter.dateFormat = "yyyy-MM-dd"
        if let newDate = formatter.date(from: date) {
            let formatterDay = DateFormatter()
            formatterDay.dateFormat = "d"
            return formatterDay.string(from: newDate)
        }
        return ""
    }
}
