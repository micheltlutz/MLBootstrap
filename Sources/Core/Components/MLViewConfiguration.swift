//
//  MLViewConfiguration.swift
//  MLBootstrap
//
//  Created by Michel Anderson Lutz Teixeira on 23/12/18.
//  Copyright © 2018 micheltlutz. All rights reserved.
//

import Foundation

public protocol MLViewConfiguration: class {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setupViewConfiguration()
}

extension MLViewConfiguration {
    public func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    public func configureViews() {
    }
}
