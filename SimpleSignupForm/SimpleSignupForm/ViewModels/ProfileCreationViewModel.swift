//
//  ProfileCreationViewModel.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

class ProfileCreationViewModel<TextFieldViewModel>: ObservableObject where TextFieldViewModel: TextFieldDisplayable {
    var heading: String
    
    var subHeadings: [String]
    
    var textFieldViewModels: [TextFieldViewModel]
    
    var canSubmit: Bool {
        textFieldViewModels.reduce(true) {
            $0 && $1.isValid
        }
    }
    
    weak var store: AppStore?
    
    init(heading: String,
         subHeadings: [String],
         textFieldViewModels: [TextFieldViewModel] = [],
         store: AppStore? = nil) {
        self.heading = heading
        self.subHeadings = subHeadings
        self.textFieldViewModels = textFieldViewModels
        self.store = store
    }
    
    func submit() {
        let name = text(for: .name)
        let password = text(for: .password)
        let email = text(for: .email)
        let website = text(for: .website)
        if canSubmit {
            store?.dispatch(.profileCreation(.submitProfile(name, password, email, website)))
        } else {
            store?.dispatch(.profileCreation(.failedToSubmitProfile(ProfileService.ProfileFetchingError.needMoreInformation)))
        }
    }
    
    func text(for type: TextFieldType) -> String {
        textFieldViewModels.first { $0.type == type }?.text ?? ""
    }
}
