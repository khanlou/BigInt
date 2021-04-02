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
        let d1 = BigInt(words: [1, 200, 1], sign: .positive)
        let d2 = BigInt(words: [1, 1, 200, 1], sign: .positive)

        let d3 = d1 + d2

        XCTAssertEqual(d3.words, [2, 201, 201, 1])
        XCTAssertEqual(d3.sign, .positive)
    }

    func testAddingWithCarryIntoANewWord() {
        let d1 = BigInt(words: [1, 200], sign: .positive)
        let d2 = BigInt(words: [1, 1, 200], sign: .positive)

        let d3 = d1 + d2

        XCTAssertEqual(d3.words, [2, 201, 200])
        XCTAssertEqual(d3.sign, .positive)
    }

    func testAddingTwoNegatives() {
        let d1 = BigInt(words: [1, 200], sign: .negative)
        let d2 = BigInt(words: [1, 1, 200], sign: .negative)

        let d3 = d1 + d2

        XCTAssertEqual(d3.words, [2, 201, 200])
        XCTAssertEqual(d3.sign, .negative)
    }

    func testAddingANegativeToAPositive() {
        let d1 = BigInt(words: [2, 2], sign: .positive)
        let d2 = BigInt(words: [1, 1], sign: .negative)

        let d3 = d1 + d2

        XCTAssertEqual(d3.words, [1, 1])
        XCTAssertEqual(d3.sign, .positive)
    }

    func testAddingAPositiveToANegative() {
        let d1 = BigInt(words: [1, 1], sign: .negative)
        let d2 = BigInt(words: [2, 2], sign: .positive)

        let d3 = d1 + d2

        XCTAssertEqual(d3.words, [1, 1])
        XCTAssertEqual(d3.sign, .positive)
    }

    func testAddingZero() {
        let d1 = BigInt(words: [232, 3], sign: .positive)
        let d2 = BigInt(words: [0], sign: .positive)

        let d3 = d1 + d2

        XCTAssertEqual(d3.words, [232, 3])
        XCTAssertEqual(d3.sign, .positive)
    }

}
