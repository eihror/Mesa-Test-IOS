//
//  BaseDataSource.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 11/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

enum HTTPResponseCode {
    static let disconnected = 0
    static let timeOutSec = 60
    static let success = 200
    static let created = 201
    static let noContent = 204
    static let badRequest = 400
    static let unauthorized = 401
    static let forbidden = 403
    static let notFound = 404
    static let timeOut = 408
    static let unprocessableEntity = 422
    static let internalServerError = 500
    static let badGateway = 502
}
    
open class BaseDataSource {
    
    func treatResponse<T>(code: Int?, data: Data?, error: NSError?, type: T.Type) throws -> T? where T:Codable {
        if error != nil {
            try errorTreatment(code: code, error: error)
        }
        
        if let code: Int = code {
            switch code {
            case HTTPResponseCode.success, HTTPResponseCode.created, HTTPResponseCode.noContent:
                do {
                    guard let resultData = data else {
                        throw ErrorsType.UNKNOWN.throwsError()
                    }
                    let jsonDecode = try JSONDecoder().decode(type.self, from: resultData)
                    return jsonDecode
                } catch {
                    print(error)
                    throw ErrorsType.UNKNOWN.throwsError()
                }
            case HTTPResponseCode.badRequest..<HTTPResponseCode.internalServerError:
                if code == HTTPResponseCode.notFound {
                    throw ErrorsType.UNKNOWN.throwsError()
                } else {
                    guard let resultData = data else {
                        throw ErrorsType.UNKNOWN.throwsError()
                    }
                    
                    let jsonDecode = try JSONDecoder().decode(ErrorResponse.self, from: resultData)
                    if let errors: [ErrorResponse] = jsonDecode.errors {
                        throw Errors.FIELD_ERRORS(errors: errors)
                    }
                    
                    throw ErrorsType.UNKNOWN.throwsError(error: jsonDecode)
                }
            default:
                throw ErrorsType.UNKNOWN.throwsError()
            }
        } else {
            throw ErrorsType.UNKNOWN.throwsError()
        }
    }
    
    private func errorTreatment(code: Int?, error: NSError?) throws {
        if let code: Int = code {
            switch code {
            case HTTPResponseCode.disconnected :
                throw ErrorsType.NO_INTERNET.throwsError()
            default:
                throw ErrorsType.UNKNOWN.throwsError()
            }
        } else {
            throw ErrorsType.UNKNOWN.throwsError()
        }
    }
}
