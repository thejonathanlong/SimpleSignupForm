//
//  Reducers.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/9/22.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(state: inout AppState, action: AppAction) {
    switch action {
        case .profileCreation(let profileCreationAction):
            profileCreationReducer(state: &state, action: profileCreationAction)
        
        case .profileConfirmation(let confirmationAction):
            profileConfirmationReducer(state: &state, action: confirmationAction)
    }
}

func profileCreationReducer(state: inout AppState, action: ProfileCreationAction) {
    switch action {
        case .submitProfile:
            break
        
        case .submittedProfile(let name, let website, let email):
            let confirmationViewModel = state.profileComfirmationState.viewModelFactory.createConfirmationViewModel(name: name, email: email, website: website)
            state.router.route(to: .confirmation(confirmationViewModel))
        
        case .failedToSubmitProfile(let error):
            state.router.route(to: .alert(error))
    }
}

func profileConfirmationReducer(state: inout AppState, action: ProfileConfirmationAction) {
    switch action {
        case .signIn:
            // Just dismiss for now...
            state.router.route(to: .dismiss)
    }
}
