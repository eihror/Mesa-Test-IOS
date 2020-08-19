//
//  ViewController.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 18/07/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

class AuthenticationViewController: BaseViewController {
    
    @IBOutlet weak var newsLabel: CustomLabel!
    @IBOutlet weak var facebookButton: CustomButton!
    @IBOutlet weak var loginButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToLoginScreen(_ sender: Any) {
        let login = LoginViewController()
        self.navigationController?.pushViewController(login, animated: true)
    }
    
    @IBAction func goToCreateAccountScreen(_ sender: Any) {
        let createAccount = CreateAccountViewController()
        self.navigationController?.pushViewController(createAccount, animated: true)
    }
}
