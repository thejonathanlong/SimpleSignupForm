//
//  Validators.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation


protocol Validator {
    func validate(text: String) throws
}

enum ValidationError: LocalizedError {
    case textShouldNotBeEmpty
    case notAValidEmail
    
    var errorDescription: String? {
        switch self {
            case .textShouldNotBeEmpty:
                return "This field should not be empty."
            
            case .notAValidEmail:
                return "Please enter a valid email."
        }
    }
}

struct NotEmptyValidator: Validator {
    func validate(text: String) throws {
        switch text.isEmpty {
            case true:
                throw ValidationError.textShouldNotBeEmpty
            case false:
                break
        }
    }
}

struct EmailAddressValidator: Validator {
    func validate(text: String) throws {
        let validEmailRegex = "[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]*"
        let predicate = NSPredicate(format:"SELF MATCHES %@", validEmailRegex)
        if !predicate.evaluate(with: text) {
            throw ValidationError.notAValidEmail
        }
    }
}
