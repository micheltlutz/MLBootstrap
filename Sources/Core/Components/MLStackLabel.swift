//
//  MLStackLabel.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 13/11/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

class MLStackLabel: UIStackView {
    let label: MLLabel
    private let padding: UIEdgeInsets

    init(text: String, padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        self.label = MLLabel(text: text)
        self.padding = padding

        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        axis = .vertical
        spacing = 0
        layoutMargins = padding
        isLayoutMarginsRelativeArrangement = true
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(label)
    }
}
