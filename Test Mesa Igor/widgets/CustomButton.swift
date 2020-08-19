//
//  OutlinedButton.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 19/07/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var buttonColor: UIColor = Colors.transparent {
        didSet {
            self.backgroundColor = buttonColor
        }
    }
    
    @IBInspectable var buttonTextColor: UIColor = .white {
        didSet {
            self.setTitleColor(buttonTextColor, for: .normal)
        }
    }
    
    @IBInspectable var strokeColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = strokeColor.cgColor
        }
    }
    
    @IBInspectable var strokeWidth: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = strokeWidth
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    private func setupView() {
        backgroundColor = buttonColor
        setTitleColor(buttonTextColor, for: .normal)
        layer.cornerRadius = 5
        layer.borderColor = strokeColor.cgColor
        layer.borderWidth = strokeWidth
        clipsToBounds = true
        
    }
    
    func setButtonColor(color: UIColor){
        buttonColor = color
        backgroundColor = buttonColor
    }
    
    func setButtonTextColor(color: UIColor) {
        buttonTextColor = color
        setTitleColor(buttonTextColor, for: .normal)
    }
    
    func setStrokeColor(color: UIColor) {
        strokeColor = color
        layer.borderColor = strokeColor.cgColor
    }
    
    func setBorder(border: CGFloat) {
        strokeWidth = border
        layer.borderWidth = strokeWidth
    }
    
    func enable(isEnable: Bool) {
        if isEnable {
            alpha = 1
        }else{
            alpha = 0.3
        }
        isEnabled = isEnable
    }
    
}
