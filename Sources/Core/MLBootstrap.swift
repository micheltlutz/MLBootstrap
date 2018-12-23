//
//  MLBootstrap.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/12/18.
//  Copyright © 2017 micheltlutz. All rights reserved.
//

import UIKit

open class MLBootstrap {
    public static let name = "MLBootstrap"
    public static let version: String = {
        guard let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String else {
            return "0.0"
        }
        return version
    }()
}
