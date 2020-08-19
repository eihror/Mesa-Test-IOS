//
//  ErrorExtensions.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 10/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

extension NSError {
    func toError() -> ErrorResponse {
        return ErrorResponse(code: "UNKNOWN", field: "", message: self.localizedDescription, errors: [])
    }
}
