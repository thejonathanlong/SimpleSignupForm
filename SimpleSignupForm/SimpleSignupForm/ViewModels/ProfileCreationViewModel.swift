//
//  ProfileCreationViewModel.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

class ProfileCreationViewModel<TextFieldViewmodel>: ObservableObject where TextFieldViewmodel: TextFieldDisplayable {
    var heading: String
    
    var subHeadings: [String]
    
    var textFieldViewModels: [TextFieldViewmodel]
    
    init(heading: String,
         subHeadings: [String],
         textFieldViewModels: [TextFieldViewmodel] = []) {
        self.heading = heading
        self.subHeadings = subHeadings
        self.textFieldViewModels = textFieldViewModels
    }
    
    func submit() {
        
    }
}
