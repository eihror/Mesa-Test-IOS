//
//  CreateAccountViewModel.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 12/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

class CreateAccountViewModel: BaseViewModel {
    
    private var authenticationUseCase = AuthenticationUseCase()

    var isValidFields: ((Bool) -> Void)?
    var onLogged: (() -> Void)?
    
    func setName(_ value: String) {
        authenticationUseCase.setName(value)
    }
    
    func setEmail(_ value: String) {
        authenticationUseCase.setEmail(value)
    }
    
    func setPassword(_ value: String) {
        authenticationUseCase.setPassword(value)
    }
    
    func setConfirmPassword(_ value: String) {
        authenticationUseCase.setConfirmPassword(value)
    }
    
    func setBirthDate(_ value: String) {
        authenticationUseCase.setBirthDate(value)
    }
    
    func validateFields(type value: ValidationType) {
        let isValid = authenticationUseCase.validateFields(type: value)
        isValidFields?(isValid)
    }
    
    func createAccount() {
        onLoading?(true)
        queue.startCoroutine(in: scope) {
            do {
                let result = try self.authenticationUseCase.createAccount()
                if result {
                    self.onLoading?(false)
                    self.onLogged?()
                }
            } catch Errors.FIELD_ERRORS(let errors) {
                self.onLoading?(false)
                self.onFieldErrorsMessage?(errors)
            } catch let error as Errors {
                print(error)
                self.onLoading?(false)
                self.onErrorMessage?(error.getFeedbackMessage())
            }
        }
    }
    
}
