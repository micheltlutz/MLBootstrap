//
//  MLLabel.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 20/12/18.
//  Copyright © 2018 micheltlutz. All rights reserved.
//

import UIKit

open class MLLabel: UILabel {
    static let name = "MLLabel"
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init(text: String, fontSize: Int = 18) {
        super.init(frame: .zero)
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .white
        font = MLFonts.SFProDisplayLight.font(size: fontSize)
        numberOfLines = 0
        textAlignment = .center
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MLLabel {
    public convenience init(textLabel: NSMutableAttributedString, color: String? = MLColorPallet.darkGrey.hex, size: Int? = 14) {
        self.init(frame: .zero)
        attributedText = textLabel
        textColor = UIColor(hex: color!)
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension MLLabel {
    public convenience init(textLabel: NSAttributedString, color: String? = MLColorPallet.darkGrey.hex, size: Int? = 14) {
        self.init(frame: .zero)
        attributedText = textLabel
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension MLLabel {
    public func paragraphStyleWith(attributedString: NSMutableAttributedString, maximunLineHeight: CGFloat) {
        let s = attributedString
        let style = NSMutableParagraphStyle()
        let lineHeight = self.font.pointSize - self.font.ascender + self.font.capHeight
        let offset = self.font.capHeight - self.font.ascender
        let range = NSRange(location: 0, length: attributedString.string.count)
        style.maximumLineHeight = maximunLineHeight
        style.minimumLineHeight = lineHeight
        style.alignment = self.textAlignment
        s.addAttribute(.paragraphStyle, value: style, range: range)
        s.addAttribute(.baselineOffset, value: offset, range: range)
        self.attributedText = s
        self.layoutSubviews()
        self.sizeToFit()
    }
}


extension MLLabel {
    public func typingAnimate(text: String, timer: Double = 0.12) {
        self.text = ""
        let characters = text.map { $0 }
        var index = 0
        Timer.scheduledTimer(withTimeInterval: timer, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            if index < text.count {
                let char = characters[index]
                self.text! += "\(char)"
                print(char)
                index += 1
            } else {
                timer.invalidate()
            }
        })
    }
}
