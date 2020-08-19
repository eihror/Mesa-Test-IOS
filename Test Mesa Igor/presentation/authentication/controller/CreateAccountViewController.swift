//
//  CreateAccountViewController.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 03/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import UIKit

class CreateAccountViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: CustomInput!
    @IBOutlet weak var email: CustomInput!
    @IBOutlet weak var password: CustomInput!
    @IBOutlet weak var confirmPassword: CustomInput!
    @IBOutlet weak var birthDate: CustomInput!
    @IBOutlet weak var buttonCreateAccount: CustomButton!
    
    private let createAccountViewModel: CreateAccountViewModel = CreateAccountViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleAttributes: [NSAttributedString.Key : Any] = [
            .font: Fonts.Roboto(.bold, size: 18),
            .foregroundColor: Colors.white
        ]
        
        setupToolbar(backgroundColor: Colors.stratos, isTranslucent: false, titleAttrs: titleAttributes, title: "Cadastrar", isGonnaHaveLeftButton: true, leftButtonAction: #selector(onBackPressed))
        
        setupBinding()
    }
    
    override func setupBinding() {
        name.setupTextField(delegate: self, type: .default, returnKey: .next, isPassword: false)
        name.inputText.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        
        email.setupTextField(delegate: self, type: .emailAddress, returnKey: .next, isPassword: false)
        email.inputText.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        
        password.setupTextField(delegate: self, type: .default, returnKey: .next, isPassword: true)
        password.inputText.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        
        confirmPassword.setupTextField(delegate: self, type: .default, returnKey: .next, isPassword: true)
        confirmPassword.inputText.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        
        birthDate.setupTextField(delegate: self, type: .default, returnKey: .next, isPassword: false)
        birthDate.inputText.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
    }
    
    override func setupView() {
        buttonCreateAccount.enable(isEnable: false)
    }
    
    override func setupObservable() {
        createAccountViewModel.isValidFields = { isValid in
            self.buttonCreateAccount.enable(isEnable: isValid)
        }
        
        createAccountViewModel.onLoading = { isLoading in
            
        }
        
        createAccountViewModel.onErrorMessage = { error in
            Toast().show(to: self, with: error)
        }
        
        createAccountViewModel.onFieldErrorsMessage = { errors in
            errors.forEach { error in
                switch error.field {
                case "email":
                    self.email.errorDescription = error.message!
                    self.email.hasError = true
                case "name":
                    self.name.errorDescription = error.message!
                    self.name.hasError = true
                case "password":
                    self.password.errorDescription = error.message!
                    self.password.hasError = true
                case .none: break
                case .some(_): break
                }
            }
        }
        
        createAccountViewModel.onLogged = {
            let home = HomeViewController()
            self.navigationController?.pushViewController(home, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case name.inputText:
            email.inputText.becomeFirstResponder()
        case email.inputText:
            password.inputText.becomeFirstResponder()
        case password.inputText:
            confirmPassword.inputText.becomeFirstResponder()
        case confirmPassword.inputText:
            birthDate.inputText.becomeFirstResponder()
        case birthDate.inputText:
            self.view.endEditing(true)
        default:
            name.inputText.becomeFirstResponder()
        }
        return true
    }
    
    @objc private func onBackPressed() {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        switch textField {
        case name.inputText:
            self.name.hasError = false
            createAccountViewModel.setName(textField.text ?? "")
        case email.inputText:
            self.email.hasError = false
            createAccountViewModel.setEmail(textField.text ?? "")
        case password.inputText:
            self.password.hasError = false
            createAccountViewModel.setPassword(textField.text ?? "")
        case confirmPassword.inputText:
            createAccountViewModel.setConfirmPassword(textField.text ?? "")
        default:
            createAccountViewModel.setBirthDate(textField.text ?? "")
        }
        createAccountViewModel.validateFields(type: .createAccount)
    }
    
    @IBAction func onCreateAccountClick(_ sender: Any) {
        if buttonCreateAccount.isEnabled {
            createAccountViewModel.createAccount()
        }
    }
    
}
