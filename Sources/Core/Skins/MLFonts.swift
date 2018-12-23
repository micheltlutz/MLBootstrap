//
//  MLFonts.swift
//  MLBootstrap
//
//  Created by Michel Anderson Lutz Teixeira on 23/12/18.
//  Copyright © 2018 micheltlutz. All rights reserved.
//

import UIKit

public enum MLFonts {
    case SFProTextLight
    case SFProTextRegular
    case SFProTextItalic
    case SFProTextMedium
    case SFProTextSemibold
    case SFProTextbold
    case SFProTextHeavy
    case SFProDisplayUltraLight
    case SFProDisplayLight
    case SFProDisplayLightIta
    case SFProDisplaySemibold
    case SFProDisplayBold
    // swiftlint:disable cyclomatic_complexity
    public func font(size: Int? = 14) -> UIFont {
        switch self {
        case .SFProTextLight:
            return UIFont(name: "SFProText-Light", size: CGFloat(size!))!
        case .SFProTextRegular:
            return UIFont(name: "SFProText-Regular", size: CGFloat(size!))!
        case .SFProTextItalic:
            return UIFont(name: "SFProText-Italic", size: CGFloat(size!))!
        case .SFProTextMedium:
            return UIFont(name: "SFProText-Medium", size: CGFloat(size!))!
        case .SFProTextSemibold:
            return UIFont(name: "SFProText-Semibold", size: CGFloat(size!))!
        case .SFProTextbold:
            return UIFont(name: "SFProText-bold", size: CGFloat(size!))!
        case .SFProTextHeavy:
            return UIFont(name: "SFProText-Heavy", size: CGFloat(size!))!
        case .SFProDisplayUltraLight:
            return UIFont(name: "SFProDisplay-Ultralight", size: CGFloat(size!))!
        case .SFProDisplayLight:
            return UIFont(name: "SFProDisplay-Light", size: CGFloat(size!))!
        case .SFProDisplayLightIta:
            return UIFont(name: "SFProDisplay-LightItalic", size: CGFloat(size!))!
        case .SFProDisplaySemibold:
            return UIFont(name: "SFProDisplay-Semibold", size: CGFloat(size!))!
        case .SFProDisplayBold:
            return UIFont(name: "SFProDisplay-Bold", size: CGFloat(size!))!
        }
    }
}
