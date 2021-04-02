//
//  BigIntTests.swift
//  BigIntTests
//
//  Created by Soroush Khanlou on 3/14/18.
//  Copyright © 2018 Soroush Khanlou. All rights reserved.
//

import XCTest
@testable import BigInt

class AdditionTests: XCTestCase {

    func testAddingTwoPositives() {
        let d1 = BigInt(65793)
        let d2 = BigInt(16843009)

        let d3 = d1 + d2

        XCTAssertEqual(d3, BigInt(16908802))
    }

    func testAddingWithCarry() {
        let d1 = BigInt(116737) //[1, 200, 1]
        let d2 = BigInt(29884673) //[1, 1, 200, 1]

        let d3 = d1 + d2

        XCTAssertEqual(d3.description, "30001410")
    }

    func testAddingWithCarryIntoANewWord() {
        let d1 = BigInt(51201) //[1, 200]
        let d2 = BigInt(13107457) //[1, 1, 200]

        let d3 = d1 + d2

        XCTAssertEqual(d3.description, "13158658")
    }

    func testAddingTwoNegatives() {
        let d1 = BigInt(-51201)
        let d2 = BigInt(-13107457)

        let d3 = d1 + d2

        XCTAssertEqual(d3.description, "-13158658")
    }

    func testAddingANegativeToAPositive() {
        let d1 = BigInt(514)
        let d2 = BigInt(-257)

        let d3 = d1 + d2

        XCTAssertEqual(d3.description, "257")
    }

    func testAddingAPositiveToANegative() {
        let d1 = BigInt(-257)
        let d2 = BigInt(514)

        let d3 = d1 + d2

        XCTAssertEqual(d3.description, "257")
    }

    func testAddingZero() {
        let d1 = BigInt(1000)
        let d2 = BigInt(0)

        let d3 = d1 + d2

        XCTAssertEqual(d3.description, "1000")
    }

}
