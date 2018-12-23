//
//  MLSizes.swift
//  MLBootstrap
//
//  Created by Michel Anderson Lutz Teixeira on 23/12/18.
//  Copyright © 2018 micheltlutz. All rights reserved.
//

import UIKit

public struct MLSizes {
    public static let baseSquareSize: CGFloat = 8.0
    public static func size(multiple: CGFloat, negative: Bool? = false) -> CGFloat {
        if negative != nil && negative! == true {
            return (MLSizes.baseSquareSize * multiple) * -1
        }
        return MLSizes.baseSquareSize * multiple
    }
    public static func printScreenSizes() {
        print("WIDTH: \(UIScreen.main.bounds.width) \n", "HEIGHT: \(UIScreen.main.bounds.height) \n")
    }
    public static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    public static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
