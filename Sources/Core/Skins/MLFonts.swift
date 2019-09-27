//
//  MLFonts.swift
//  MLBootstrap
//
//  Created by Michel Anderson Lutz Teixeira on 23/12/18.
//  Copyright © 2018 micheltlutz. All rights reserved.
//

import UIKit

public struct MLFontManager {
    static func loadAllFonts() {
        for font in MLFonts.allCases {
            registerFontWith(filename: font.filename)
        }
    }

    public static func loadFont(filename: String, bundleIdentifier: String) {
        registerFontWith(filename: filename)
    }

    static func registerFontWith(filename: String) {
        let bundleddd = Bundle(for: MLBootstrap.self)
        let pathForResourcedddd = bundleddd.path(forResource: filename, ofType: nil)
        //let test = Bundle.main.path(forResource: "SF-Pro-Text-Light", ofType: "otf")
        print("filename: \(pathForResourcedddd)")

        let frameworkBundle = Bundle(for: MLBootstrap.self)
        let pathForResource = frameworkBundle.path(forResource: filename, ofType: nil)
        let fontData = NSData(contentsOfFile: pathForResource!)
        let dataProvider = CGDataProvider(data: fontData!)
        var errorRef: Unmanaged<CFError>?
        if let fontRef = CGFont(dataProvider!) {
            if CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) == false {
                // swiftlint:disable line_length
                fatalError("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
            }
        } else {
            // swiftlint:disable line_length
            fatalError("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }

    }
}
public enum MLFonts: CaseIterable {
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

    public var filename: String {
        switch self {
        case .SFProTextLight:
            return "SF-Pro-Text-Light.otf"
        case .SFProTextRegular:
            return "SF-Pro-Text-Regular.otf"
        case .SFProTextItalic:
            return "SF-Pro-Text-RegularItalic.otf"
        case .SFProTextMedium:
            return "SF-Pro-Text-Medium.otf"
        case .SFProTextSemibold:
            return "SF-Pro-Text-Semibold.otf"
        case .SFProTextbold:
            return "SF-Pro-Text-Bold.otf"
        case .SFProTextHeavy:
            return "SF-Pro-Text-Heavy.otf"
        case .SFProDisplayUltraLight:
            return "SF-Pro-Display-Ultralight.otf"
        case .SFProDisplayLight:
            return "SF-Pro-Display-Light.otf"
        case .SFProDisplayLightIta:
            return "SF-Pro-Display-LightItalic.otf"
        case .SFProDisplaySemibold:
            return "SF-Pro-Display-Semibold.otf"
        case .SFProDisplayBold:
            return "SF-Pro-Display-Bold.otf"
        }
    }
}
