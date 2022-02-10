//
//  ProfileConfirmationViewModelFactoryTests.swift
//  SimpleSignupFormTests
//
//  Created by Jonathan Long on 2/9/22.
//

import XCTest
@testable import SimpleSignupForm

class ProfileConfirmationViewModelFactoryTests: XCTestCase {

    func testProfileConfirmationViewModelFactoryBasic() {
        let factory = ProfileConfirmationViewModelFactory()
        let expectedName = "blah"
        let expectedEmail = "blah@blah.com"
        let expectedWebSite = "blah.com"
        let vm = factory.createConfirmationViewModel(name: expectedName,
                                                     email: expectedEmail,
                                                     website: expectedWebSite)
        
        XCTAssertEqual(vm.email, expectedEmail)
        XCTAssertEqual(vm.name, expectedName)
        XCTAssertEqual(vm.website, expectedWebSite)
    }
}
