//
//  ProfileCreationViewModelFactoryTests.swift
//  SimpleSignupFormTests
//
//  Created by Jonathan Long on 2/9/22.
//

@testable import SimpleSignupForm
import XCTest

class ProfileCreationViewModelFactoryTests: XCTestCase {

    func testProfieCreationViewModelFactoryBasic() {
        let profileCreationViewModelFactory = ProfileCreationViewModelFactory()
        
        let expectedHeading = "Frank Burns Eat Worms"
        let expectedSubHeadings = ["Frank Burns eats worms until:", "Charles Emerson Winchester does."]
        
        let profile = profileCreationViewModelFactory.createProfileViewModel(heading:expectedHeading, subHeading: expectedSubHeadings)
        
        XCTAssertEqual(profile.heading, expectedHeading)
        XCTAssertEqual(profile.subHeadings, expectedSubHeadings)
        XCTAssertEqual(profile.canSubmit, false)
        XCTAssertEqual(profile.textFieldViewModels.count, 4)
    }

}
