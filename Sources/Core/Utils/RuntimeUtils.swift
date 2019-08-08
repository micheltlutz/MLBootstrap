//
//  RuntimeUtils.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 06/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public struct RuntimeUtils {
    public static let deviceName = UIDevice.current.name
    public static let bundleID: String = Bundle.main.bundleIdentifier!
    public static func showFontFamily() {
        for name in UIFont.familyNames {
            print(UIFont.fontNames(forFamilyName: name))
        }
    }

    public static func languageISO() -> String {
        //        let locale = Locale.current
        //        guard let languageCode = locale.languageCode,
        //            let regionCode = locale.regionCode else {
        //                return "pt-BR"
        //        }
        //        return languageCode + "-" + regionCode
        return "pt-BR"
    }
    
    public static func defaultLocale() -> Locale {
        return Locale(identifier: "pt_BR")
    }
    
    public static func defaultTimeZone() -> TimeZone {
        guard let timeZone = TimeZone(abbreviation: "BRT") else { return Calendar.current.timeZone }
        return timeZone
    }
    
    public enum StatusBarColors {
        case red
        case white
        case clear
    }
    
    public static func changeStatusBarColor(type: StatusBarColors) {
        switch type {
        case .red:
            if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
                    statusBar.backgroundColor = MLColorPallet.red.color
                }
            }
        case .white:
            if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
                    statusBar.backgroundColor = .white
                }
            }
        case .clear:
            if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
                    statusBar.backgroundColor = UIColor.clear
                }
            }
        }
    }

    public static func alertController(message: String, title: String = "", okAction: UIAlertAction? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var OKAction: UIAlertAction!
        if let action = okAction {
            OKAction = action
        } else {
            OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        }
        alertController.addAction(OKAction)
        return alertController
    }

    public static func getHeightFromWidth(width: Int) -> Int {
        switch width {
        case 375:
            return 117
        case 750:
            return 174
        case 1125:
            return 431
        default:
            return 117
        }
    }

    public static func getHeightFromWidth(width: CGFloat) -> CGFloat {
        switch width {
        case 375:
            return 117
        case 750:
            return 174
        case 1125:
            return 431
        default:
            return 117
        }
    }
}
