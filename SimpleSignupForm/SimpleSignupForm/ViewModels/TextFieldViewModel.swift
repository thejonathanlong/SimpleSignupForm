//
//  TextFieldViewModel.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

class TextFieldViewModel: TextFieldDisplayable {
    var placeHolder: String
    
    @Published var text: String
    
    @Published var error: String
    
    var validators: [Validator]
    
    var type: TextFieldType
    
    var isValid: Bool = false
    
    init(type: TextFieldType,
         text: String = "",
         error: String = "",
         validators: [Validator] = []) {
        self.type = type
        self.placeHolder = type.placeHolder
        self.text = text
        self.error = error
        self.validators = validators
        self.isValid = validators.isEmpty
    }
    
    func didSubmit() {
        for validator in validators {
            do {
                try validator.validate(text: text)
                self.error = ""
                isValid = true
            } catch let error {
                self.error = error.localizedDescription
                isValid = false
                break
            }
        }
    }
}
