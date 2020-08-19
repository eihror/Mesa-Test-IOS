//
//  Fonts.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 19/07/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import UIKit

struct Fonts {
    public enum RobotoType: String {
        case medium = "-Medium"
        case light = "-Light"
        case regular = "-Regular"
        case boldItalic = "-BoldItalic"
        case lightItalic = "-LightItalic"
        case italic = "-Italic"
        case bold = "-Bold"
    }
    
    public static func Roboto(_ type: RobotoType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Roboto\(type.rawValue)", size: size)!
    }
}
