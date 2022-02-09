//
//  ProfileCreationViewModelFactory.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

struct ProfileCreationViewModelFactory {
    static func createProfileViewModel(heading: String, subHeading: [String]) -> ProfileCreationViewModel<TextFieldViewModel> {
            
        let firstNameTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .normal("First Name"))
        let emailTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .email("Email Address"))
        let passwordTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .required("Password"))
        let websiteTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .required("Website"))
        
            return ProfileCreationViewModel(heading: heading,
                                            subHeadings: subHeading,
                                            textFieldViewModels: [firstNameTextFieldViewModel, emailTextFieldViewModel, passwordTextFieldViewModel, websiteTextFieldViewModel ])
    }
}
