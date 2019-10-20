//
//  MLPickerField.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 29/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

/*
 Define MLPickerFieldOptionsType is a array of [Tuple(text: String, key: String)]
 */
public typealias MLPickerFieldOptionsType = [(key: String, value: String)]

// MARK: - MLPickerFieldProtocol Protocol
public protocol MLPickerFieldProtocol {
    /*
     SelectedOption is a optional
     */
    var selectedOption: String? { get set }
    /*
     Options with MLPickerFieldOptionsType

     SeeAlso `MLPickerFieldOptionsType`
     */
    var options: MLPickerFieldOptionsType { get set }
    func cancel()
    func done()
}

// MARK: - MLPickerField extends MLField and implements MLPickerFieldProtocol
public class MLPickerField: MLField, MLPickerFieldProtocol {
    public var selectedOption: String?
    public var options: MLPickerFieldOptionsType
    public var didChangeOption: ((_ option: String) -> Void)?
    private var toolBarTint: UIColor = UIColor.systemBlue
    private let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    /**
     Initilizer

     - Parameter placeholder: ***String*** Text to show in placeholder and label field
     - Parameter options: ***MLPickerFieldOptionsType*** an MLPickerFieldOptionsType
     - Parameter toolBarTint: ***UIColor*** an UIColor default UIColor.systemBlue
     */
    public init(placeHolder: String,
                options: MLPickerFieldOptionsType,
                toolBarTint: UIColor = UIColor.systemBlue) {
        self.options = options

        super.init(placeHolder: placeHolder)

        rightViewMode = .always
        returnKeyType = .done
        self.toolBarTint = toolBarTint
        pickerView.delegate = self
        pickerView.dataSource = self
        makeToolBar()
    }

    // MARK: - Config Picker View
    private func makeToolBar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolBar.tintColor = toolBarTint
        let btCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        let btDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let btFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [btCancel, btFlexibleSpace, btDone]
        inputAccessoryView = toolBar
        inputView = pickerView
    }
    /*
     Handle to cancel UIBarButtonItem. Only resign Keyboard
     */
     @objc public func cancel() {
        resignFirstResponder()
    }
    /*
     Handle to done UIBarButtonItem. Set de picker view value to MLField text and callHandle cancel to resign Keyboard
     */
     @objc public func done() {
        text = options[pickerView.selectedRow(inComponent: 0)].value
        cancel()
    }
}

// MARK: - Extension MLPickerField implements UIPickerViewDelegate and UIPickerViewDataSource
extension MLPickerField: UIPickerViewDelegate, UIPickerViewDataSource {
    /*
     Default numberOfComponents.

     returns Int - Default 1
     */
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    /*
     Default numberOfComponents.

     returns Int - Default 1
     */
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    /*
     Default numberOfComponents.

     returns String - option[row].text
     */
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row].value
    }
    /*
     Default didSelectRow. Set de value to selectedOption
     */
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedOption = options[row].key
        didChangeOption?(options[row].key)
    }
}
