//
//  AuthenticationDataSourceRemote.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 09/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit
import SwiftCoroutine
import Resolver

class AuthenticationDataSourceRemote: BaseDataSource, AuthenticationDataSource {
    
    @Injected private var userRepository: UserRepository
    @Injected private var network: Network
    
    func doLogin(_ email: String, _ password: String) throws -> Bool {
        let request = SignInRequest(email: email, password: password)
        
        let dataInFuture = try network.request(service: TestApi.signIn, parameters: request.params()).await()
        
        let result = try self.treatResponse(code: dataInFuture.code, data: dataInFuture.result, error: dataInFuture.error, type: TokenResponse.self)
        
        if let token = result?.token {
            userRepository.setAccessToken(token)
            return true
        } else {
            return false
        }
    }
    
    func createAccount(_ name: String, _ email: String, _ password: String) throws -> Bool {
        let request = SignUpRequest(name: name, email: email, password: password)
        
        let dataInFuture = try network.request(service: TestApi.signUp, parameters: request.params()).await()
        
        let result = try self.treatResponse(code: dataInFuture.code, data: dataInFuture.result, error: dataInFuture.error, type: TokenResponse.self)
        
        if let token = result?.token {
            userRepository.setAccessToken(token)
            return true
        } else {
            return false
        }
    }
    
}
