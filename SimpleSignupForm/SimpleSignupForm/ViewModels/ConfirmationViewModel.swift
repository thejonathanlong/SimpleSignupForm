//
//  ConfirmationViewModel.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/9/22.
//

import Foundation

struct ConfirmationViewModel {
    
    weak var store: AppStore?
    
    var heading: String {
        "Hello, \(name)"
    }
    
    var message: String {
        "Your super-awesome portfolio has been succesfully submitted! The details below will be public within your community!"
    }
    
    var website: String
    var name: String
    var email: String
    
    init(website: String, name: String, email: String, store: AppStore? = nil) {
        self.website = website
        self.name = name
        self.email = email
        self.store = store
    }
    
    func signIn() {
        store?.dispatch(.profileConfirmation(.signIn))
    }
}
