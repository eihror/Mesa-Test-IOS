//
//  AuthenticationUseCase.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 05/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import Resolver

enum ValidationType {
    case login
    case createAccount
}

class AuthenticationUseCase {
    
    @Injected private var repository: AuthenticationRepository
    
    private var name: String = ""
    private var email: String = ""
    private var password: String = ""
    private var confirmPassword: String = ""
    private var birthDate: String = ""

    func setName(_ value: String) {
        name = value
    }
    
    func setEmail(_ value: String) {
        email = value
    }
    
    func setPassword(_ value: String) {
        password = value
    }
    
    func setConfirmPassword(_ value: String) {
        confirmPassword = value
    }
    
    func setBirthDate(_ value: String) {
        birthDate = value
    }
        
    func validateFields(type value: ValidationType) -> Bool {
        let isValidName = !name.isEmpty && name.isValidName
        let isValidEmail = !email.isEmpty && email.isValidEmail
        let isValidPassword = !password.isEmpty && password.isValidPassword
        let isValidConfirmPassword = !confirmPassword.isEmpty && confirmPassword.isValidPassword && password == confirmPassword
        
        switch value {
        case .login:
            return isValidEmail && isValidPassword
        default:
            return isValidName && isValidEmail && isValidPassword && isValidConfirmPassword
        }
    }
    
    func login() throws -> Bool {
        try repository.doLogin(email, password)
    }
    
    func createAccount() throws -> Bool {
        try repository.createAccount(name, email, password)
    }
    
}
