//
//  ErrorsType.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 12/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

enum ErrorsType: String {
    case UNKNOWN = "UNKNOWN"
    case NO_INTERNET = "NO_INTERNET"
    case INVALID_CREDENTIALS = "INVALID_CREDENTIALS"
    case BLANK = "BLANK"
    case INVALID = "INVALID"
    case INVALID_TOKEN = "INVALID_TOKEN"
    case FIELD_ERRORS = "FIELD_ERRORS"
}

extension ErrorsType {
    func throwsError(error: ErrorResponse? = nil) -> Errors {
        if let error = error {
            switch error.code {
            case ErrorsType.NO_INTERNET.rawValue:
                return .NO_INTERNET
            case ErrorsType.INVALID_CREDENTIALS.rawValue:
                return .INVALID_CREDENTIALS
            case ErrorsType.BLANK.rawValue:
                return .BLANK
            case ErrorsType.INVALID.rawValue:
                return .INVALID
            case ErrorsType.INVALID_TOKEN.rawValue:
                return .INVALID_TOKEN
            case ErrorsType.FIELD_ERRORS.rawValue:
                return .FIELD_ERRORS(errors: error.errors!)
            default:
                return .UNKNOWN
            }
        } else {
            switch self {
            case .NO_INTERNET:
                return .NO_INTERNET
            case .INVALID_CREDENTIALS:
                return .INVALID_CREDENTIALS
            case .BLANK:
                return .BLANK
            case .INVALID:
                return .INVALID
            case .INVALID_TOKEN:
                return .INVALID_TOKEN
            default:
                return .UNKNOWN
            }
        }
    }
}
