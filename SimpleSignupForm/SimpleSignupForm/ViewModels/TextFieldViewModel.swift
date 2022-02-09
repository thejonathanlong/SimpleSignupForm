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
    
    var error: String
    
    init(placeHolder: String, text: String = "", error: String = "") {
        self.placeHolder = placeHolder
        self.text = text
        self.error = error
    }
}
