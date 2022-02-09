//
//  AppState.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

enum AppAction {
    case profileCreation(ProfileCreationAction)
}

struct AppState {
    let profileCreationState = ProfileCreationState()
}

enum ProfileCreationAction {
    case submitProfile
}

struct ProfileCreationState {
    
}
