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
        let height = MLSizes.size(multiple: 5)
        heightAnchor.constraint(equalToConstant: height).isActive = true
        layer.cornerRadius = height / 2
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

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
