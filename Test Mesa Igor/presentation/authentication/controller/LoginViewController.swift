///Users/igormelo/Documents/Development/ios/Mesa/Test Mesa Igor/Test Mesa Igor/presentation/authorization/controller/LoginViewController.swift
//  LoginViewController.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 19/07/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var buttonLogin: CustomButton!
    @IBOutlet weak var buttonFacebook: CustomButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    private let loginViewModel: LoginViewModel = LoginViewModel()
    
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
        
        setupToolbar(backgroundColor: Colors.stratos, isTranslucent: false, titleAttrs: titleAttributes, title: "Entar com e-mail", isGonnaHaveLeftButton: true, leftButtonAction: #selector(onBackPressed))
        
        setupBinding()
    }
    
    override func setupBinding() {
        email.delegate = self
        password.delegate = self
        
        email.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        password.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
    }
    
    override func setupView() {
        buttonLogin.enable(isEnable: false)
    }
    
    override func setupObservable() {
        loginViewModel.isValidFields = { isValid in
            self.buttonLogin.enable(isEnable: isValid)
        }
        
        loginViewModel.onLoading = { isLoading in
            
        }
        
        loginViewModel.onErrorMessage = { error in
            Toast().show(to: self, with: error)
        }
        
        loginViewModel.onLogged = {
            let home = HomeViewController()
            self.navigationController?.pushViewController(home, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case password:
            if buttonLogin.isEnabled {
                doLogin()
            }
            password.resignFirstResponder()
            self.view.endEditing(true)
        default:
            password.becomeFirstResponder()
        }
        return true
    }
    
    private func doLogin() {
        loginViewModel.login()
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        switch textField {
            case password:
                loginViewModel.setPassword(textField.text ?? "")
            default:
                loginViewModel.setEmail(textField.text ?? "")
        }
        loginViewModel.validateFields(type: .login)
    }
    
    @objc private func onBackPressed() {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    @IBAction func onLoginClick(_ sender: Any) {
        if buttonLogin.isEnabled {
            doLogin()
        }
    }
    
    @IBAction func goToCreateAccountScreen(_ sender: Any) {
        let createAccount = CreateAccountViewController()
        self.navigationController?.pushViewController(createAccount, animated: true)
    }
    
}
