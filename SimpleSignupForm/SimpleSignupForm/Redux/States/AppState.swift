//
//  AppState.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

enum AppAction {
    case profileCreation(ProfileCreationAction)
    case profileConfirmation(ProfileConfirmationAction)
}

struct AppState {
    let profileCreationState = ProfileCreationState(viewModelFactory: ProfileCreationViewModelFactory())
    let profileComfirmationState = ProfileConfirmationState(viewModelFactory: ProfileConfirmationViewModelFactory())
    
    var router: RouteController
    
    init(router: RouteController = Router.shared) {
        self.router = router
    }
}
