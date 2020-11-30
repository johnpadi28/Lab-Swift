//
//  TDDTests.swift
//  TDDTests
//
//  Created by John Padilla on 11/30/20.
//

import XCTest
@testable import TDD

class TDDTests: XCTestCase {
    var sut: Person!

    override func setUpWithError() throws {
        let expectAge = 0
        sut = Person(name: "Person", age: expectAge, height: 0, weight: 0)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Init_WithReuiredParams_SetRequiredParams() {

        XCTAssertEqual(sut.name, "Person")
        XCTAssertEqual(sut.age, 0)
    }
    
    func test_Init_WithoutOptionalParams_DoesntSetParam() {
        XCTAssertNotNil(sut.height)
        XCTAssertNotNil(sut.weight)
    }
    
    func test_Init_WithOptionalParam_OptionalParamNotNil() {
        XCTAssertNotNil(sut.height)
        XCTAssertNotNil(sut.weight)
    }
    
    func test_Init_WithOptionalParam_SetsOptionalParam() {
        XCTAssertEqual(sut.height, 0)
        XCTAssertEqual(sut.weight, 0)
    }
}
