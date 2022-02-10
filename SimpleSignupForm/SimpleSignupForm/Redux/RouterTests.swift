//
//  RouterTests.swift
//  SimpleSignupFormTests
//
//  Created by Jonathan Long on 2/10/22.
//

import XCTest
@testable import SimpleSignupForm

class RouterTests: XCTestCase {

    let router = Router()
    
    override func setUp() {
        router.rootViewController = UIViewController()
        let window = UIWindow()
        window.rootViewController = router.rootViewController
        window.makeKeyAndVisible()
    }
    
    func testRoutingToConfirmationShowsConfirmationView() {
        router.route(to: .confirmation(ConfirmationViewModel(website: "www.google.com", name: "Jonathan", email: "jonathan@long.com", store: nil)))
        XCTAssertNotNil(router.rootViewController?.presentedViewController as? HostedViewController<ConfirmationView>)
    }
    
    func testRoutingToAnAlertShowsAlert() {
        router.route(to: .alert(MockError.fakeError))
        XCTAssertNotNil(router.rootViewController?.presentedViewController as? UIAlertController)
    }
    
    func testRoutingToLoadingShowsLoadingView() {
        router.route(to: .loading(true))
        XCTAssertNotNil(router.rootViewController?.presentedViewController as? HostedViewController<LoadingView>)
    }

}
