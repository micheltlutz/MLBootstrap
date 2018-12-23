//
//  UIView+constraints.swift
//  feedNEtFlix
//
//  Created by Michel Anderson Lutz Teixeira on 10/04/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func constraint(pattern: String, views: UIView...) {
        var myViews: [String: UIView] = [:]
        for(index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            myViews["v\(index)"] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: pattern,
                                                      options: NSLayoutConstraint.FormatOptions(),
                                                     metrics: nil, views: myViews))
    }
}
