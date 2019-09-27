// swift-tools-version:5.1
//
//  MLBootstrap.swift
//  MLBootstrap
//
//  Created by Michel Lutz on 23/10/15.
//  Copyright © 2017 micheltlutz. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "MLBootstrap",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "MLBootstrap",
            targets: ["MLBootstrap"])
        ],
    dependencies: [],
    targets: [
        .target(
            name: "MLBootstrap",
            dependencies: [],
            path: "Sources"),
        re
        .testTarget(
            name: "MLBootstrapTests",
            dependencies: ["MLBootstrap"],
            path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)
