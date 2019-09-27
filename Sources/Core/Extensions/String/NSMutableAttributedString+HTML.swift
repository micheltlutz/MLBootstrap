//
//  NSMutableAttributedString+HTML.swift
//  MLBootstrap-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 26/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    public convenience init?(html: String, font: UIFont, color: String = "") {
        let h2Size = font.pointSize + 10.0
        let h1Style = """
                            h1{ font-size: \(font.pointSize + 10.0)pt !important;
                            color: #333333;
                            font-weight:100 !important;}
                          """
        let h2Style = """
                            h2{ font-size: \(h2Size)pt !important;
                            color: #333333;
                            font-weight:100 !important;}
                           """
        let h3Style = """
                            h3{ font-size: \(font.pointSize + 3.0)pt !important;
                            color: #333333;
                            font-weight:100 !important;}
                          """

        let htmlCSSString = "<style>" +
            "body" +
            "{" +
            " font-size: \(font.pointSize)pt !important;" +
            "color: \(color) !important;" +
            " font-family: \"\(font.familyName)\", Helvetica !important;" +
            //            " line-height: 1.47 !important;" +
            "}" + h1Style + h2Style + h3Style +
        "</style> \(html)"
        //print("h2Size--------", h2Size)
        guard let data = htmlCSSString.data(using: String.Encoding.unicode, allowLossyConversion: false) else {
            return nil
        }
        // swiftlint:disable line_length
        guard let attributedString = try? NSAttributedString(data: data,
                                                             options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                                                             documentAttributes: nil) else {
                                                                return nil
        }
        self.init(attributedString: attributedString)
    }
    public func setBaseFont(baseFont: UIFont, preserveFontSizes: Bool = false) {
        let baseDescriptor = baseFont.fontDescriptor
        let wholeRange = NSRange(location: 0, length: length)
        beginEditing()
        enumerateAttribute(.font, in: wholeRange, options: []) { object, range, _ in
            guard let font = object as? UIFont else { return }
            // Instantiate a font with our base font's family, but with the current range's traits
            let traits = font.fontDescriptor.symbolicTraits
            guard let descriptor = baseDescriptor.withSymbolicTraits(traits) else { return }
            let newSize = preserveFontSizes ? descriptor.pointSize : baseDescriptor.pointSize
            let newFont = UIFont(descriptor: descriptor, size: newSize)
            self.removeAttribute(.font, range: range)
            self.addAttribute(.font, value: newFont, range: range)
        }
        endEditing()
    }
}
