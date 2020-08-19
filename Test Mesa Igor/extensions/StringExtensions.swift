//
//  StringExtensions.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 05/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

extension String {
    var localizable: String {
        NSLocalizedString(self, comment: "")
    }
    
    var isValidName: Bool {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        let words = components.filter { !$0.isEmpty }
        
        return words.count >= 2
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        return self.count > 3
    }
}
