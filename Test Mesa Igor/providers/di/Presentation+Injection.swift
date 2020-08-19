//
//  Presentation+Injection.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Resolver

extension Resolver {
    static func registerAppController() {
        register { AppController() }.scope(application)
        register { Network() }.scope(application)
    }
}
