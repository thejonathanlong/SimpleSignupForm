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
    
    init(placeHolder: String,
         text: String = "",
         error: String = "",
         validators: [Validator] = []) {
        self.placeHolder = placeHolder
        self.text = text
        self.error = error
        self.validators = validators
    }
    
    func didSubmit() {
        for validator in validators {
            do {
                try validator.validate(text: text)
                self.error = ""
            } catch let error {
                self.error = error.localizedDescription
                break
            }
        }
    }
}
