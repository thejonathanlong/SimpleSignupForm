//
//  StoreTests.swift
//  SimpleSignupFormTests
//
//  Created by Jonathan Long on 2/10/22.
//

import XCTest
@testable import SimpleSignupForm

class MockRouter: RouteController {
    var rootViewController: UIViewController?
    
    var currentRoute: Route = .loading(false)
    
    func route(to destination: Route) {
        currentRoute = destination
    }
}

extension Route: Equatable {
    public static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
            case (.loading(let val), .loading(let otherVal)):
                return val == otherVal
            case (.confirmation(_), .confirmation(_)):
                return true
            case (.alert(_), .alert(_)):
                return true
            case (.dismiss, .dismiss):
                return true
            default:
                return false
        }
    }
}

enum MockError: LocalizedError {
    case fakeError
}

class StoreTests: XCTestCase {

    func testProfileCreationSubmittedActionRoutesToConfirmation() {
        let router = MockRouter()
        let store = AppStore(initialState: AppState(router: router), reducer: appReducer)
        store.dispatch(AppAction.profileCreation(.submittedProfile("name", "pass", "web")))
        
        XCTAssertEqual(router.currentRoute, Route.confirmation(ConfirmationViewModel(website: "", name: "", email: "", store: nil)))
    }
    
    func testProfileCreationFailedtoSubnmitRoutesToAlert() {
        let router = MockRouter()
        let store = AppStore(initialState: AppState(router: router), reducer: appReducer)
        store.dispatch(AppAction.profileCreation(.failedToSubmitProfile(MockError.fakeError)))
        
        XCTAssertEqual(router.currentRoute, Route.alert(MockError.fakeError))
    }
    
    func testProfileCreationLoadingActionRoutesToLoading() {
        let router = MockRouter()
        let store = AppStore(initialState: AppState(router: router), reducer: appReducer)
        store.dispatch(AppAction.profileCreation(.loading))
        
        XCTAssertEqual(router.currentRoute, Route.loading(true))
    }
}
