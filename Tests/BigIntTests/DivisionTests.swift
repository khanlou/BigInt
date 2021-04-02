//
//  MultiplicationTests.swift
//  BigIntTests
//
//  Created by Soroush Khanlou on 3/16/18.
//  Copyright © 2018 Soroush Khanlou. All rights reserved.
//

import XCTest
@testable import BigInt

class DivisionTests: XCTestCase {
    
    func testBasicDivision() {
        let d1 = BigInt(words: [100, 0], sign: .positive)

        let d3 = d1 / 2

        XCTAssertEqual(d3.words, [50])
        XCTAssertEqual(d3.sign, .positive)
    }

    func testDivisionWithRemainder() {
        let d1 = BigInt(words: [232, 3], sign: .positive) // 1000

        let d3 = d1 / UInt8(100)

        XCTAssertEqual(d3.words, [10])
        XCTAssertEqual(d3.sign, .positive)
    }

    func testDivisionWithRemainder2() {
        let d1 = BigInt("6550")!

        let d3 = d1 / UInt8(10)

        XCTAssertEqual(d3.words, [143,2])
        XCTAssertEqual(d3.sign, .positive)
    }


}
