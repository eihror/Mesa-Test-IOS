//
//  ErrorResponse.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 07/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    let code: String?
    let field: String?
    let message: String?
    let errors: [ErrorResponse]?
}
