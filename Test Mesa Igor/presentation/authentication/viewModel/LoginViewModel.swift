//
//  CreateAccountViewModel.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 05/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

class LoginViewModel: BaseViewModel {
    
    private var authenticationUseCase = AuthenticationUseCase()

    var isValidFields: ((Bool) -> Void)?
    var onLogged: (() -> Void)?
    
    func setEmail(_ value: String) {
        authenticationUseCase.setEmail(value)
    }
    
    func setPassword(_ value: String) {
        authenticationUseCase.setPassword(value)
    }
    
    func validateFields(type value: ValidationType) {
        let isValid = authenticationUseCase.validateFields(type: value)
        isValidFields?(isValid)
    }
    
    func login() {
        onLoading?(true)
        queue.startCoroutine(in: scope) {
            do {
                let result = try self.authenticationUseCase.login()
                if result {
                    self.onLoading?(false)
                    self.onLogged?()
                }
            } catch let error as Errors {
                print(error)
                self.onLoading?(false)
                self.onErrorMessage?(error.getFeedbackMessage())
            }
        }
    }
    
}
