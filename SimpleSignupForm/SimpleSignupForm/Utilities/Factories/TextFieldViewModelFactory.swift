//
//  TextFieldViewModelFactory.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

struct TextFieldViewModelFactory {
    
    static func createTextFieldViewModel(for type: TextFieldType) -> TextFieldViewModel {
        switch type {
            case .name:
                return TextFieldViewModel(type: .name)
                
            case .email:
                return TextFieldViewModel(type: .email, validators: [NotEmptyValidator(), EmailAddressValidator()])
            case .password:
                return TextFieldViewModel(type: .password, validators: [NotEmptyValidator()])
                
            case .website:
                return TextFieldViewModel(type: .website, validators: [NotEmptyValidator()])
        }
    }
}
