//
//  CustomInputViewController.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 14/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomInput: UIView {
    
    private static let NIB_NAME = "CustomInput"
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBInspectable var inputName: String = "" {
        didSet {
            inputLabel.text = inputName
        }
    }
    
    @IBInspectable var errorDescription: String = "" {
        didSet {
            errorLabel.text = errorDescription
        }
    }
    
    @IBInspectable var hasError: Bool = true {
        didSet {
            errorLabel.isHidden = !hasError
        }
    }
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            inputText.keyboardType = keyboardType
        }
    }
    
    var keyboardReturnKey: UIReturnKeyType = .next {
        didSet {
            inputText.returnKeyType = keyboardReturnKey
        }
    }
    
    var isPassword: Bool = false {
        didSet {
            inputText.isSecureTextEntry = isPassword
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
        self.setupView()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: CustomInput.self)
        bundle.loadNibNamed(String(describing: CustomInput.self), owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        sendSubviewToBack(view)
    }
    
    private func setupView() {
        errorLabel.isHidden = true
        inputText.keyboardType = .default
        inputText.returnKeyType = .next
        inputText.isSecureTextEntry = false
    }
    
    func setupTextField(delegate textFieldDelegate: UITextFieldDelegate, type keyboardType: UIKeyboardType, returnKey returnKeyType: UIReturnKeyType, isPassword secureTextEntry: Bool) {
        inputText.delegate = textFieldDelegate
        inputText.keyboardType = keyboardType
        inputText.returnKeyType = returnKeyType
        inputText.isSecureTextEntry = secureTextEntry
    }
}
