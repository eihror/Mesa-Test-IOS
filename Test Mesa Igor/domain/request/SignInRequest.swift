//
//  AuthRequest.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 09/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit


struct SignInRequest {
    var email: String?
    var password: String?
    
    func params() -> [String: Any] {
        var body: [String: Any] = [:]
        if let email = email {
            body["email"] = email
        }
        if let password = password {
            body["password"] = password
        }
        return body
    }
}
