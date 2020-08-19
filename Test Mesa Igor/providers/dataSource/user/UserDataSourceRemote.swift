//
//  UserDataSourceRemote.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import KeychainAccess
import Resolver

class UserDataSourceRemote: UserDataSource {
    
    private var keychain: Keychain {
        return Resolver.resolve()
    }
    
    func setAccessToken(_ token: String) {
        keychain[PreferencesType.accessToken.rawValue] = "Bearer \(token)"
    }
    
    func getAccessToken() -> String? {
        return keychain[PreferencesType.accessToken.rawValue] ?? nil
    }
    
}
