//
//  MLDatePickerField.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 29/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public class MLDatePickerField: MLField {
    private let datePicker = UIDatePicker()
    public var dateFormmater = "dd/MM/yyyy"
    /**
     Initilizer

     - Parameter placeholder: ***String*** Text to show in placeholder and label field
     - Parameter datePickerMode: ***UIDatePicker.Mode*** an UIDatePicker.Mode default .date
     */
    public init(placeHolder: String, datePickerMode: UIDatePicker.Mode = .date) {
        super.init(placeHolder: placeHolder)

        rightViewMode = .always
        returnKeyType = .done
        datePicker.datePickerMode = datePickerMode
        makeToolBar()
    }

    // MARK: - Config Picker View
    private func makeToolBar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolBar.tintColor = UIColor.lightGray
        let btCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        let btDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let btFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [btCancel, btFlexibleSpace, btDone]
        inputAccessoryView = toolBar
        inputView = datePicker
    }
    // MARK: - ToolBarActions

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
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormmater
        text = formatter.string(from: datePicker.date)

        cancel()
    }
}
