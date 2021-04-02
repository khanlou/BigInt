//
//  MultiplicationTests.swift
//  BigIntTests
//
//  Created by Soroush Khanlou on 3/16/18.
//  Copyright © 2018 Soroush Khanlou. All rights reserved.
//

import XCTest
@testable import BigInt

class MultiplicationTests: XCTestCase {
    
    func testMultiplyingTwoPositives() {
        let d1 = BigInt(10)
        let d2 = BigInt(10)

        let d3 = d1 * d2

        XCTAssertEqual(d3.description, "100")
    }

    func testMultiplyingTwoPositivesWithOverflow() {
        let d1 = BigInt(100)
        let d2 = BigInt(10)

        let d3 = d1 * d2

        XCTAssertEqual(d3.description, "1000")
    }


    func testMultiplyingOnePositiveAndOneNegativeWithOverflow() {
        let d1 = BigInt(100)
        let d2 = BigInt(-10)

        let d3 = d1 * d2

        XCTAssertEqual(d3.description, "-1000")
    }

    func testMultiplyingOneNegativeAndOnePositiveWithOverflow() {
        let d1 = BigInt(-100)
        let d2 = BigInt(10)

        let d3 = d1 * d2

        XCTAssertEqual(d3.description, "-1000")
    }

    func testMultiplyingOverflow() {
        let d1 = BigInt(545)
        let d2 = BigInt(10)

        let d3 = d1 * d2

        XCTAssertEqual(d3.description, "5450")
    }

    func testMultiplyingOverflow2() {
        let d1 = BigInt(655)
        let d2 = BigInt(10)

        let d3 = d1 * d2

        XCTAssertEqual(d3.description, "6550")
    }

}
