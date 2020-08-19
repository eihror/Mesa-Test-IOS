//
//  AuthenticationDataSource.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 12/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

protocol AuthenticationDataSource {
    func doLogin(_ email: String, _ password: String) throws -> Bool
    func createAccount(_ name: String, _ email: String, _ password: String) throws -> Bool
}
