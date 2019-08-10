//
//  MLColorPallet.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/12/18.
//  Copyright © 2018 micheltlutz. All rights reserved.
//

import UIKit

public protocol MLColorPalletProtocol {
    var hex: String { get }
    var color: UIColor { get }
    var cgColor: CGColor { get }
    func color(percent: Int) -> UIColor
    func color(alpha: CGFloat) -> UIColor
}

public enum MLColorPallet: String, MLColorPalletProtocol {
    case red = "BC233E"
    case darkRed = "A31E36"
    case deepOceanBlue = "2C3E50"
    case deepOceanDarkBlue = "29394A"
    case pink = "8E44AD"
    case purple = "5C2C70"
    case yellow = "F1C40F"
    case orange = "FF9500"
    case indigo = "5856D6"
    case darkYellow = "C29E0C"
    case babyBlue = "2980B9"
    case babyDarkBlue = "1B557A"
    case darkGrey = "333333"
    case black = "000000"

    public var hex: String {
        return self.rawValue
    }
    public var color: UIColor {
        return UIColor(hex: self.rawValue)
    }
    public var cgColor: CGColor {
        return UIColor(hex: self.rawValue).cgColor
    }

    public func color(percent: Int) -> UIColor {
        let rgb = MLMath.hexToRGB(hex: self.rawValue)
        let calc = MLMath.calcColor(red: rgb.red, green: rgb.green, blue: rgb.blue, percent: Float(percent))
        return UIColor(red: CGFloat(calc.red), green: CGFloat(calc.green), blue: CGFloat(calc.blue), alpha: 1)
    }

    public func color(alpha: CGFloat) -> UIColor {
        let colorAlpha = UIColor(hex: self.rawValue).withAlphaComponent(alpha)
        return colorAlpha
    }

    public func imageFromColor() -> UIImage {
        let size = CGSize(width: 1, height: 1)
        let color = UIColor(hex: self.rawValue)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }

    public func imageFromColor(alpha: CGFloat) -> UIImage {
        let size = CGSize(width: 1, height: 1)
        let color = UIColor(hex: self.rawValue).withAlphaComponent(alpha)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}
