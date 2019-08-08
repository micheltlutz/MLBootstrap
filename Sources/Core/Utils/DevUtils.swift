//
//  DevUtils.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 06/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public struct DevUtils {
    public static let randomColors: [UIColor] = [
        UIColor(red: 0.121569, green: 0.466667, blue: 0.705882, alpha: 1),
        UIColor(red: 1, green: 0.498039, blue: 0.054902, alpha: 1),
        UIColor(red: 0.172549, green: 0.627451, blue: 0.172549, alpha: 1),
        UIColor(red: 0.839216, green: 0.152941, blue: 0.156863, alpha: 1),
        UIColor(red: 0.580392, green: 0.403922, blue: 0.741176, alpha: 1),
        UIColor(red: 0.54902, green: 0.337255, blue: 0.294118, alpha: 1),
        UIColor(red: 0.890196, green: 0.466667, blue: 0.760784, alpha: 1),
        UIColor(red: 0.498039, green: 0.498039, blue: 0.498039, alpha: 1),
        UIColor(red: 0.737255, green: 0.741176, blue: 0.133333, alpha: 1),
        UIColor(red: 0.337255, green: 0.341176, blue: 0.333333, alpha: 1),
        UIColor(red: 0.237255, green: 0.241176, blue: 0.233333, alpha: 1),
        UIColor.purple
    ]
    
    public static func randomizedColor() -> UIColor {
        return DevUtils.randomColors[Int(arc4random_uniform(UInt32(DevUtils.randomColors.count)))]
    }
}
