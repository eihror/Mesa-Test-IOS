//
//  AuthenticationRepositoryRemote.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 09/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import Resolver

class AuthenticationRepositoryRemote: AuthenticationRepository {
    
    @Injected private var dataSource: AuthenticationDataSource
    
    func doLogin(_ email: String, _ password: String) throws -> Bool  {
        try dataSource.doLogin(email, password)
    }
    
    func createAccount(_ name: String, _ email: String, _ password: String) throws -> Bool {
        try dataSource.createAccount(name, email, password)
    }
    
}
