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

struct NotEmptyValidator: Validator {
    enum EmptyValidationError: LocalizedError {
        case textShouldNotBeEmpty
        
        var errorDescription: String? {
            switch self {
                case .textShouldNotBeEmpty:
                    return "This field should not be empty."
            }
        }
    }
    
    func validate(text: String) throws {
        switch text.isEmpty {
            case true:
                throw EmptyValidationError.textShouldNotBeEmpty
            case false:
                break
        }
    }
    
    
}
