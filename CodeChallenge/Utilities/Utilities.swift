//
//  Utilities.swift
//  CodeChallenge
//
//  Created by Abu Hamdan on 11/16/21.
//

import Foundation

class Utilities {
    
    static let shared = Utilities()
    private init() {}
    
    func validateEmail(email: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    
    }
}

