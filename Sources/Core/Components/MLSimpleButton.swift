//
//  MLSimpleButton.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 17/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

open class MLSimpleButton: UIButton {
    public static let name = "MLSimpleButton"

    public init(text: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: MLSizes.size(multiple: 6)).isActive = true
        setTitle(text, for: .normal)
        backgroundColor = .none
        setTitleColor(UIColor.gray, for: .normal)
        setTitleColor(UIColor.darkGray, for: .focused)
        setTitleColor(UIColor.darkGray, for: .highlighted)
        setTitleColor(UIColor.lightGray, for: .disabled)
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
