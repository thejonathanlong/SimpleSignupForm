//
//  TextFieldViewModelFactory.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

struct TextFieldViewModelFactory {
    enum TextFieldType {
        case required(String)
        case normal(String)
        case email(String)
    }
    
    static func createTextFieldViewModel(for type: TextFieldType) -> TextFieldViewModel {
        switch type {
            case .normal(let placeHolder):
                return TextFieldViewModel(placeHolder: placeHolder)
                
            case .required(let placeHolder):
                return TextFieldViewModel(placeHolder: placeHolder, validators: [NotEmptyValidator()])
                
            case .email(let placeHolder):
                return TextFieldViewModel(placeHolder: placeHolder, validators: [NotEmptyValidator(), EmailAddressValidator()])
        }
        
    }
}
