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
    }
}

func profileCreationReducer(state: inout AppState, action: ProfileCreationAction) {
    switch action {
        case .submitProfile:
            break
        
        case .submittedProfile(let name, let website, let email):
            state.router.route(to: .confirmation(ConfirmationViewModel(website: website, name: name, email: email)))
        
        case .failedToSubmitProfile(let error):
            state.router.route(to: .alert(error))
    }
}
