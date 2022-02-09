//
//  ProfileService.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/9/22.
//

import Foundation

protocol ProfileFetching {
    func submitProfile(name: String, password: String, website: String, email: String) async throws
}

class ProfileService: ProfileFetching {
    enum ProfileFetchingError: LocalizedError {
        case failedToSubmitProfile
        
        var errorDescription: String? {
            switch self {
                case .failedToSubmitProfile:
                    return "Oops! Something went wrong on our end. Please try again in a few minutes,"
            }
        }
    }
    
    func submitProfile(name: String, password: String, website: String, email: String) async throws {
        sleep(2)
        let random = Int.random(in: 1..<10)
        if random % 10 == 3 || random % 10 == 5 || random % 10 == 7 {
            throw ProfileFetchingError.failedToSubmitProfile
        }
    }
}
