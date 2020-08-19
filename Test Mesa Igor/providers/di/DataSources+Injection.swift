//
//  DataSources+Injection.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 12/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import Resolver
import KeychainAccess

extension Resolver {
    public static func registerDataSources() {
        register { Keychain(service: "com.eihror.Test-Mesa-Igor").accessibility(.afterFirstUnlock) }
        
        register { UserDataSourceRemote() }
            .implements(UserDataSource.self)
            .scope(application)
        
        register { AuthenticationDataSourceRemote() }
            .implements(AuthenticationDataSource.self)
            .scope(application)
        
        register { NewsDataSourceRemote() }
            .implements(NewsDataSource.self)
            .scope(application)
    }
}
