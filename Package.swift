// swift-tools-version:4.2
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
    products: [
        .library(
            name: "MLBootstrap",
            targets: ["MLBootstrap"]),
        ],
    dependencies: [],
    targets: [
        .target(
            name: "MLBootstrap",
            dependencies: ["UIKit"],
            path: "Sources"),
        .testTarget(
            name: "MLBootstrapTests",
            dependencies: ["MLBootstrap"],
            path: "Tests")
    ]
)
