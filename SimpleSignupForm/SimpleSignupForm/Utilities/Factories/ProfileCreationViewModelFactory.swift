//
//  ProfileCreationViewModelFactory.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

class ProfileCreationViewModelFactory {
    weak var store: AppStore?
    
    init(store: AppStore? = nil) {
        self.store = store
    }
    
    func createProfileViewModel(heading: String, subHeading: [String]) -> ProfileCreationViewModel<TextFieldViewModel> {
            
        let firstNameTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .normal("First Name"))
        let emailTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .email("Email Address"))
        let passwordTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .required("Password"))
        let websiteTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .required("Website"))
        
        let profileCreationViewModel = ProfileCreationViewModel(heading: heading,
                                            subHeadings: subHeading,
                                            textFieldViewModels: [firstNameTextFieldViewModel, emailTextFieldViewModel, passwordTextFieldViewModel, websiteTextFieldViewModel ])
        profileCreationViewModel.store = store
        return profileCreationViewModel
    }
}
