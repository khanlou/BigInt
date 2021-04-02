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
        let d1 = BigInt(words: [10], sign: .positive)
        let d2 = BigInt(words: [10], sign: .positive)

        let d3 = d1 * d2

        XCTAssertEqual(d3.words, [100])
        XCTAssertEqual(d3.sign, .positive)
    }

    func testMultiplyingTwoPositivesWithOverflow() {
        let d1 = BigInt(words: [100], sign: .positive)
        let d2 = BigInt(words: [10], sign: .positive)

        let d3 = d1 * d2

        XCTAssertEqual(d3.words, [232, 3])
        XCTAssertEqual(d3.sign, .positive)
    }


    func testMultiplyingOnePositiveAndOneNegativeWithOverflow() {
        let d1 = BigInt(words: [100], sign: .positive)
        let d2 = BigInt(words: [10], sign: .negative)

        let d3 = d1 * d2

        XCTAssertEqual(d3.words, [232, 3])
        XCTAssertEqual(d3.sign, .negative)
    }

    func testMultiplyingOneNegativeAndOnePositiveWithOverflow() {
        let d1 = BigInt(words: [100], sign: .negative)
        let d2 = BigInt(words: [10], sign: .positive)

        let d3 = d1 * d2

        XCTAssertEqual(d3.words, [232, 3])
        XCTAssertEqual(d3.sign, .negative)
    }

    func testMultiplyingOverflow() {
        let d1 = BigInt(words: [33, 2], sign: .positive)
        let d2 = BigInt(words: [10], sign: .positive)

        let d3 = d1 * d2

        XCTAssertEqual(d3.words, [74, 21])
    }

    func testMultiplyingOverflow2() {
        let d1 = BigInt(words: [143, 2], sign: .positive)
        let d2 = BigInt(words: [10], sign: .positive)

        let d3 = d1 * d2

        XCTAssertEqual(d3.description, "6550")
    }

}
