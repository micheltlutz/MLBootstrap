//
//  MLQuestionCheck.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 30/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

/**
 MLQuestionCheck Extends UIView
 */
open class MLQuestionCheck: UIView {
    /**
     Component name name
     */
    static let name = "MLQuestionCheck"

    /**
     labelQuestion as UILabel instance and pre configured
     */
    public let labelQuestion: UILabel = {
        let labelQuestion = UILabel(frame: .zero)
        labelQuestion.translatesAutoresizingMaskIntoConstraints = false
        labelQuestion.text = ""
        labelQuestion.textColor = UIColor(hex: "333333")
        labelQuestion.numberOfLines = 0
        labelQuestion.lineBreakMode = .byWordWrapping
        return labelQuestion
    }()
    /**
     Define a state component
     */
    open var isChecked = false {
        didSet {
            setupCheck()
        }
    }
    /**
     Define a string question.
     */
    open var question: String = "" {
        didSet {
            if question != "" {
                labelQuestion.text = question
                updateHeightContraint()
            }
        }
    }
    /**
     Define a font for Label question
     */
    open var font: UIFont = UIFont.systemFont(ofSize: 10, weight: .light) {
        didSet {
            labelQuestion.font = font
            updateHeightContraint()
        }
    }
    /**
     Define a font for Label question when checked
     */
    open var fontChecked: UIFont = UIFont.systemFont(ofSize: 30, weight: .bold) {
        didSet {
            labelQuestion.font = fontChecked
            updateHeightContraint()
        }
    }
    /**
     Handler called when check or uncheck component
     */
    open var didChangeState: ((_ isChecked: Bool) -> Void)?
    /**
     Image Name for unchecked state component
     */
    open var uncheckedImageName: String?
    /**
     Image Name for checked state component
     */
    open var checkedImageName: String?
    /**
     Define width for component default value UIScreen.main.bounds.width.
     */
    open var widthQuestion: CGFloat = UIScreen.main.bounds.width {
        didSet {
            updateWidthConstraints()
        }
    }
    /**
     Min height from component Default CGFloat(36) can you chenge
     when you swipe images and size images uncheckedImageName or checkedImageName

     - SeeAlso: `MLQuestionCheckButton`
     */
    open var minHeightQuestion: CGFloat = 36
    /**
     Dynamic heightQuestion this value change when you chenge font,
     question or width component, default value CGFloat(36)
     */
    open private(set) var heightQuestion: CGFloat = 36
    /**
     Contains NSLayoutConstraint self heightAnchor.constraint
     */
    open private(set) var heightConstraint: NSLayoutConstraint?
    /**
     Contains NSLayoutConstraint self widthAnchor.constraint
     */
    open private(set) var widthConstraint: NSLayoutConstraint?
    /**
     checkButton contains a object MLQuestionCheckButton

     - SeeAlso: `MLQuestionCheckButton`
     */
    public let checkButton = MLQuestionCheckButton()

    /**
     Create a simple Check component
     - Parameters:
     - question: String with a Question for component.
     - checked: Bool? if true component init checked Default value false

     ### Usage Example: ###
     ````
     let question1 = MLQuestionCheck(question: "You are ok?")
     question1.didChangeState = { checked in

     }
     ````
     */
    convenience public init(question: String, checked: Bool? = false) {
        self.init(frame: .zero)
        self.question = question
        self.labelQuestion.text = question
        self.isChecked = checked!
        if checked! {
            self.labelQuestion.font = fontChecked
            self.checkButton.viewState = .checked
        } else {
            self.labelQuestion.font = font
            self.checkButton.viewState = .unChecked
        }
        self.setupButtonActions()
        self.setupCheck()
        self.setupTouchAreaFullComponent()
        self.setupViewConfiguration()
    }
    /**
     Setup Tapto UIView conteiner
     */
    private func setupTouchAreaFullComponent() {
        self.addTapGestureRecognizer {
            if self.checkButton.viewState == .checked {
                self.actionUncheck()
            } else {
                self.actionCheck()
            }
        }
    }
    /**
     Call this function when you change the images names self
     uncheckedImageName or checkedImageName,
     this function chenge images on checkButton: MLQuestionCheckButton

     - SeeAlso: `MLQuestionCheckButton`
     */
    open func setupCheck() {
        if let uncheckedImageName = uncheckedImageName {
            checkButton.uncheckedImageName = uncheckedImageName
        }
        if let checkedImageName = checkedImageName {
            checkButton.checkedImageName = checkedImageName
        }
    }
    /**
     Change State to Check
     */
    private func actionCheck() {
        self.isChecked = true
        self.checkButton.viewState = .checked
        self.labelQuestion.font = self.fontChecked
        self.didChangeState?(true)
    }
    /**
     Change State to Uncheck
     */
    private func actionUncheck() {
        self.isChecked = false
        self.checkButton.viewState = .unChecked
        self.labelQuestion.font = self.font
        self.didChangeState?(false)
    }
    /**
     This method setup button actions for check and uncheck
     */
    private func setupButtonActions() {
        checkButton.didCheck = { [weak self] in
            guard let self = self else { return }
            self.actionCheck()
        }
        checkButton.didUncheck = { [weak self] in
            guard let self = self else { return }
            self.actionUncheck()
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
/**
 Implementing MLViewConfiguration

 - SeeAlso: `MLViewConfiguration`
 */
extension MLQuestionCheck: MLViewConfiguration {
    /**
     Update width question constraint
     */
    private func updateWidthConstraints() {
        if let unwrappedWidthConstraint = widthConstraint {
            unwrappedWidthConstraint.constant = widthQuestion
        }
        updateHeightContraint()
    }
    /**
     Update height question
     */
    private func updateHeightQuestion() {
        var fontToResize: UIFont!
        if isChecked {
            fontToResize = fontChecked
        } else {
            fontToResize = font
        }
        labelQuestion.font = fontToResize
        heightQuestion = question.heightWithConstrainedWidth(width: (widthQuestion - checkButton.sizeIcon - 16),
                                                             font: fontToResize)
    }
    /**
     Update height question constraint
     */
    private func updateHeightContraint() {
        updateHeightQuestion()
        if heightQuestion < minHeightQuestion { heightQuestion = minHeightQuestion }
        if let unwrappedHeightConstraint = heightConstraint {
            unwrappedHeightConstraint.constant = heightQuestion
        }
    }
    /**
     Setup constraints component
     */
    public func setupConstraints() {
        updateHeightQuestion()
        if heightQuestion < minHeightQuestion { heightQuestion = minHeightQuestion }
        heightConstraint = heightAnchor.constraint(equalToConstant: heightQuestion)
        heightConstraint?.isActive = true
        widthConstraint = widthAnchor.constraint(equalToConstant: widthQuestion)
        widthConstraint?.isActive = true
        checkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        checkButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelQuestion.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor,
                                               constant: 0).isActive = true
        labelQuestion.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        labelQuestion.centerYAnchor.constraint(equalTo: checkButton.centerYAnchor).isActive = true
    }
    /**
     Add Subview to superview creating view hierarchy
     */
    public func buildViewHierarchy() {
        addSubview(checkButton)
        addSubview(labelQuestion)
    }
    /**
     Default configuration view
     */
    public func configureViews() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
