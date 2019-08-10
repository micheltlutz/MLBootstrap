//
//  MLButton.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/12/18.
//  Copyright © 2018 micheltlutz. All rights reserved.
//

import UIKit

open class MLButton: UIButton {
    public static let name = "MLButton"

    public init(text: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: MLSizes.size(multiple: 6)).isActive = true
        layer.cornerRadius = 10
        clipsToBounds = true
        setTitle(text, for: .normal)
        backgroundColor = MLColorPallet.black.color(alpha: 0.1)
        setTitleColor(UIColor.white, for: .normal)
        setTitleColor(UIColor.white, for: .focused)
        setTitleColor(UIColor.white, for: .highlighted)
        setTitleColor(UIColor.lightGray, for: .disabled)
        setBackgroundImage(MLColorPallet.black.imageFromColor(alpha: 0.1), for: .normal)
        setBackgroundImage(MLColorPallet.black.imageFromColor(alpha: 0.3), for: .focused)
        setBackgroundImage(MLColorPallet.black.imageFromColor(alpha: 0.3), for: .highlighted)
        setBackgroundImage(MLColorPallet.black.imageFromColor(alpha: 0.05), for: .disabled)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
