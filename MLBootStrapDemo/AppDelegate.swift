//
//  AppDelegate.swift
//  MLBootStrapDemo
//
//  Created by Michel Anderson Lutz Teixeira on 27/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit
import MLBootstrap

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        MLBootstrap.configure()

        return true
    }
}
