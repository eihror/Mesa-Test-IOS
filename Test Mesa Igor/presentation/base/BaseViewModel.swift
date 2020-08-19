//
//  BaseViewModel.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 05/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import SwiftCoroutine

class BaseViewModel {
    var queueBackground : DispatchQueue = DispatchQueue.global(qos: .background)
    var queue : DispatchQueue = DispatchQueue.main
    
    let scope = CoScope()
    
    var onErrorMessage: ((String) -> Void)?
    var onFieldErrorsMessage: (([ErrorResponse]) -> Void)?
    var onLoading: ((Bool) -> Void)?
    
}
