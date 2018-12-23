//
//  MLField.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/12/18.
//  Copyright © 2018 micheltlutz. All rights reserved.
//

import UIKit

open class MLField: UITextField {
    public static let name = "MLField"
    
    public init(placeHolder: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        textColor = .white
        font = MLFonts.SFProDisplayLight.font(size: 20)
        heightAnchor.constraint(equalToConstant: MLSizes.size(multiple: 5)).isActive = true
        layer.cornerRadius = MLSizes.size(multiple: 5) / 2
        attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textAlignment = .center
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
