//
//  Middleware.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/9/22.
//

import Combine
import Foundation

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?

func profileServiceMiddleware(service: ProfileFetching) -> Middleware<AppState, AppAction> {
    return { _, action in
        switch action {
            case .profileCreation(.submitProfile(let name, let password, let website, let email)):
                return Future<AppAction, Never> { promise in
                    Task {
                        do {
                            try await service.submitProfile(name: name, password: password, website: website, email: email)
                            promise(.success(.profileCreation(.submittedProfile(name, website, email))))
                        } catch let error {
                            promise(.success(.profileCreation(.failedToSubmitProfile(error))))
                        }
                        
                    }
                }.eraseToAnyPublisher()
                
            default:
                break
        }
        
        return Empty().eraseToAnyPublisher()
        
    }
}
