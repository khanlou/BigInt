//
//  MultiplicationTests.swift
//  BigIntTests
//
//  Created by Soroush Khanlou on 3/16/18.
//  Copyright © 2018 Soroush Khanlou. All rights reserved.
//

import XCTest
import BigInt

class DivisionTests: XCTestCase {
    
    func testBasicDivision() {
        let d1 = BigInt(100)

        let d3 = d1 / 2

        XCTAssertEqual(d3.description, "50")
    }

    func testDivisionWithRemainder() {
        let d1 = BigInt(1000)

        let d3 = d1 / UInt8(100)

        XCTAssertEqual(d3.description, "10")
    }

    func testDivisionWithRemainder2() {
        let d1 = BigInt(6550)

        let d3 = d1 / UInt8(10)

        XCTAssertEqual(d3.description, "655")
    }


}
