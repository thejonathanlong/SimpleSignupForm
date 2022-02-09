//
//  AppState.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

enum AppAction {
    
}

struct AppState {
    let profileCreationState = ProfileCreationState()
}

struct ProfileCreationState {
    var profileCreationViewModel: ProfileCreationViewModel<TextFieldViewModel> {
        let firstNameTextFieldViewModel = TextFieldViewModel(placeHolder: "First Name")
        let emailTextFieldViewModel = TextFieldViewModel(placeHolder: "Email Address", validators: [NotEmptyValidator()])
        let passwordTextFieldViewModel = TextFieldViewModel(placeHolder: "Password", validators: [NotEmptyValidator()])
        let websiteTextFieldViewModel = TextFieldViewModel(placeHolder: "Website", validators: [NotEmptyValidator()])
        
       return ProfileCreationViewModel(heading: "Profile Creation",
                                subHeadings: ["Use the form below to submit your portfolio.",
                                              "An email and password are required."],
                                textFieldViewModels: [firstNameTextFieldViewModel,
                                                     emailTextFieldViewModel,
                                                     passwordTextFieldViewModel,
                                                     websiteTextFieldViewModel])
    }
    
}
