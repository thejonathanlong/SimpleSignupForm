//
//  ProfileConfirmationViewModelFactory.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/9/22.
//

import Foundation

class ProfileConfirmationViewModelFactory {
    
    weak var store: AppStore? {
        didSet {
            print("JLO: \(store)")
        }
    }
    
    init(store: AppStore? = nil) {
        self.store = store
    }
    
    func createConfirmationViewModel(name: String, email: String, website: String) -> ConfirmationViewModel {
        ConfirmationViewModel(website: website, name: name, email: email, store: store)
    }
}
