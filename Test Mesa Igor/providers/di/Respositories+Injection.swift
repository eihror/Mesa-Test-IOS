//
//  Respositories+Injection.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 09/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Resolver

extension Resolver {
    public static func registerRepositories() {
        register { UserRepositoryRemote() }
            .implements(UserRepository.self)
            .scope(application)
        
        register { AuthenticationRepositoryRemote() }
            .implements(AuthenticationRepository.self)
            .scope(application)
        
        register { NewsRepositoryRemote() }
            .implements(NewsRepository.self)
            .scope(application)
    }
}
