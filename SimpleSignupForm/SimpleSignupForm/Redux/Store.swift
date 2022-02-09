//
//  Store.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Combine
import Foundation
import SwiftUI

typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {

    // Read only access to app state
    @Published private(set) var state: State

    var tasks = [AnyCancellable?]()

    let serialQueue = DispatchQueue(label: "com.jlo.store.serial.queue")

    private let reducer: Reducer<State, Action>
    let middlewares: [Middleware<State, Action>]
    private var middlewareCancellables: Set<AnyCancellable> = []

    init(initialState: State,
         reducer: @escaping Reducer<State, Action>,
         middlewares: [Middleware<State, Action>] = []) {
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middlewares
    }

    // The dispatch function.
    func dispatch(_ action: Action) {
        reducer(&state, action)

        // Dispatch all middleware functions
        for mw in middlewares {
            guard let middleware = mw(state, action) else {
                break
            }
            var can: AnyCancellable?
            can = middleware
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { [weak self] in
                    guard let self = self,
                          let can = can else { return }
                    self.dispatch($0)
                    can.cancel()
                    self.middlewareCancellables.remove(can)
                })
            if let can = can {
                middlewareCancellables.insert(can)
            }

        }
    }
}


typealias Reducer<State, Action> = (inout State, Action) -> Void

// MARK: - Reducers
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
        
        case .failedToSubmitProfile:
            // Router should show an alert to try again
            break
    }
}

protocol ProfileService {
    func submitProfile(name: String, password: String, website: String, email: String) async throws
}

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?
func profileServiceMiddleware(service: ProfileService) -> Middleware<AppState, AppAction> {
    return { _, action in
        switch action {
            case .profileCreation(.submitProfile(let name, let password, let website, let email)):
                return Future<AppAction, Never> { promise in
                    Task {
                        do {
                            try await service.submitProfile(name: name, password: password, website: website, email: email)
                            promise(.success(.profileCreation(.submittedProfile(name, website, email))))
                        } catch _ {
                            promise(.success(.profileCreation(.failedToSubmitProfile)))
                        }
                        
                    }
                }.eraseToAnyPublisher()
                
            default:
                break
        }
        
        return Empty().eraseToAnyPublisher()
        
    }
}
