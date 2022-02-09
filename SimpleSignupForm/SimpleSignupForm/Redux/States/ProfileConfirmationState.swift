//
//  ProfileConfirmationState.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/9/22.
//

import Foundation

enum ProfileConfirmationAction {
    case signIn
}

struct ProfileConfirmationState {
    var viewModelFactory: ProfileConfirmationViewModelFactory
}
