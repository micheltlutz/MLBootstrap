//
//  MLQuestionCheckButton.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 30/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

/**
 Enum: String define a Button states checked, unChecked
 */
public enum MLQuestionButtonState: String {
    case checked, unChecked
}

open class MLQuestionCheckButton: UIButton {
    /**
    Handler called when check component
    */
    open var didCheck: (() -> Void)?
    /**
     Handler called when uncheck component
     */
    open var didUncheck: (() -> Void)?
    /**
     This var contains the images names uncheckedImageName
     default value ***questionUnchecked*** just have a file in Assets with this name
     */
    open var uncheckedImageName = "questionUnchecked" {
        didSet {
            setupImages()
        }
    }
    /**
     This var contains the images names checkedImageName
     default value ***questionChecked*** just have a file in Assets with this name
     */
    open var checkedImageName = "questionChecked" {
        didSet {
            setupImages()
        }
    }
    /**
     Contains a Size Icon default value CGFloat(36)
     */
    open var sizeIcon = CGFloat(36)
    /**
     Contains a viewState

     - SeeAlso: `MLQuestionButtonState`
     */
    open var viewState: MLQuestionButtonState = .unChecked {
        didSet {
            setupImages()
        }
    }
    /**
     Init Component
     */
    convenience init() {
        self.init(frame: .zero)
        addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        setImage(UIImage(named: uncheckedImageName), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
    }
    /**
     Setup images setting image names
     */
    internal func setupImages() {
        if viewState == .unChecked {
            setImage(UIImage(named: uncheckedImageName), for: .normal)
        } else {
            setImage(UIImage(named: checkedImageName), for: .normal)
        }
    }
    /**
     Default public initializer
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    /**
     Default required initializer
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MLQuestionCheckButton {
    /**
     Target #selector for Button
     */
    @objc fileprivate func touchUpInsideButton() {
        if viewState == .checked {
            didUncheck?()
        } else {
            didCheck?()
        }
    }
}
