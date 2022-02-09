//
//  ProfileCreationState.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/9/22.
//

import Foundation

enum ProfileCreationAction {
    case submitProfile(String, String, String, String)
    case submittedProfile(String, String, String)
    case failedToSubmitProfile(Error)
}

struct ProfileCreationState {
    var viewModelFactory: ProfileCreationViewModelFactory
}
