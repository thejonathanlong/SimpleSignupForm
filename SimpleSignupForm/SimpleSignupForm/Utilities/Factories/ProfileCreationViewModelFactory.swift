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
            
        let firstNameTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .name)
        let emailTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .email)
        let passwordTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .password)
        let websiteTextFieldViewModel = TextFieldViewModelFactory.createTextFieldViewModel(for: .website)
        
        let profileCreationViewModel = ProfileCreationViewModel(heading: heading,
                                            subHeadings: subHeading,
                                            textFieldViewModels: [firstNameTextFieldViewModel, emailTextFieldViewModel, passwordTextFieldViewModel, websiteTextFieldViewModel ])
        profileCreationViewModel.store = store
        return profileCreationViewModel
    }
}
