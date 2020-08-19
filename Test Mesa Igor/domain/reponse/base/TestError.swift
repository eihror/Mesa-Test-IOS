//
//  TestError.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 09/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import UIKit

enum Errors : Error {
    case NO_INTERNET
    case INVALID_CREDENTIALS
    case BLANK
    case INVALID
    case INVALID_TOKEN
    case UNKNOWN
    case FIELD_ERRORS(errors: [ErrorResponse])
    
    func getFeedbackMessage() -> String {
        switch self {
        case .NO_INTERNET:
            return "Verifique sua conexão e tente novamente"
        case .INVALID_CREDENTIALS:
            return "Credenciais inválidas"
        case .BLANK:
            return "Campo em branco"
        case .INVALID:
            return "Campo inválido"
        case .INVALID_TOKEN:
            return "Token inválido"
        case .UNKNOWN:
            return "Ocorreu um erro. Por favor, tente novamente."
        case .FIELD_ERRORS:
            return ""
        }
    }
}
