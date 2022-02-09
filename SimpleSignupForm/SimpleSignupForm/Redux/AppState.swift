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
    case submitProfile(String, String, String, String)
    case submittedProfile(String, String, String)
    case failedToSubmitProfile
}

struct ProfileCreationState {
    
}
