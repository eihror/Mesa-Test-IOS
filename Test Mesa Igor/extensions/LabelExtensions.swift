//
//  LabelExtensions.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 19/07/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func addCharacterSpacing(kernValue: Double = 1) {
        if let labelText = text, labelText.count > 0 {
          let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
          attributedText = attributedString
        }
    }
}
