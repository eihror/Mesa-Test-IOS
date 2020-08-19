//
//  UserRepositoryRemote.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import Resolver

class UserRepositoryRemote: UserRepository {
    
    @Injected private var dataSource: UserDataSource
    
    func setAccessToken(_ token: String) {
        dataSource.setAccessToken(token)
    }
    
    func getAccessToken() -> String? {
        return dataSource.getAccessToken()
    }
    
    
}
