//
//  Math.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/12/18.
//  Copyright © 2018 Codigo da Mente Edicao E Comercio De Livros E Testes. All rights reserved.
//

import UIKit

public struct MLMath {
    public static func percent(fromValue: UInt64, percent: UInt64) -> UInt64 {
        return (fromValue * percent) / 100
    }
    public static func percent(fromValue: Float, percent: Float) -> Float {
        return (fromValue * percent) / 100
    }
    public static func percent(fromValue: Double, percent: Double) -> Double {
        return (fromValue * percent) / 100
    }
    public static func hexToDec(hex: String) -> UInt64 {
        if let val = UInt64(hex, radix: 16) {
            return val
        }
        return 0
    }
    public static func hexPercent(hex: String, percent: Float) -> String {
        let decimal = MLMath.hexToDec(hex: hex)
        let percentValue = MLMath.percent(fromValue: decimal, percent: UInt64(percent))
        return String(percentValue, radix: 16, uppercase: true)
    }
    // swiftlint:disable large_tuple
    public static func hexToRGB(hex: String) -> (red: Float, green: Float, blue: Float) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff
        return (red: Float(red), green: Float(green), blue: Float(blue))
    }
    // swiftlint:disable large_tuple
    public static func calcColor(red: Float, green: Float, blue: Float, percent: Float) -> (red: Float, green: Float, blue: Float) {
        let redn = red / 255
        let greenn = green / 255
        let bluen = blue / 255
        let red = MLMath.percent(fromValue: redn, percent: percent)
        let green = MLMath.percent(fromValue: greenn, percent: percent)
        let blue = MLMath.percent(fromValue: bluen, percent: percent)
        return (red: redn + red, green: greenn + green, blue: bluen + blue)
    }
    // swiftlint:disable large_tuple
    public static func calcColor(hex: String, percent: Float) -> (red: Float, green: Float, blue: Float) {
        let rgb = MLMath.hexToRGB(hex: hex)
        return MLMath.calcColor(red: rgb.red, green: rgb.green, blue: rgb.blue, percent: percent)
    }

    public static func lineSpacingFrom(xdLineSpacing: Int) -> CGFloat {
        return CGFloat(Double(xdLineSpacing) * 0.24)
    }
}
