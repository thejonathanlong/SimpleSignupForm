//
//  ValidatorTests.swift
//  SimpleSignupFormTests
//
//  Created by Jonathan Long on 2/10/22.
//

import XCTest
@testable import SimpleSignupForm

class ValidatorTests: XCTestCase {
    func testEmailValidator() throws {
        let validator = EmailAddressValidator()
        try validator.validate(text: "jonathan3721@mac.com")
    }
    
    func testEmailValidatorInvalid() throws {
        let validator = EmailAddressValidator()
        do {
            try validator.validate(text: "jonathan3721@.com")
        } catch let error as ValidationError {
            XCTAssertEqual(error.errorDescription, "Please enter a valid email.")
        }
    }
    
    func testNotEmptyValidator() throws {
        let validator = NotEmptyValidator()
        try validator.validate(text: "hello")
    }
    
    func testNotEmptyValidatorInvalid() throws {
        let validator = NotEmptyValidator()
        do {
            try validator.validate(text: "")
        } catch let error as ValidationError {
            XCTAssertEqual(error.errorDescription, "This field should not be empty.")
        }
        
    }
}
