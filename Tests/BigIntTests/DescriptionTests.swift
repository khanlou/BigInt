//
//  DescriptionTests.swift
//  BigIntTests
//
//  Created by Soroush Khanlou on 3/31/21.
//  Copyright © 2021 Soroush Khanlou. All rights reserved.
//

import XCTest
@testable import BigInt

class DescriptionTests: XCTestCase {


    func testExample() throws {
        XCTAssertEqual(BigInt(words: [232, 3], sign: .positive).description, "1000")
    }

    func testRoundTrip() throws {
//        XCTAssertEqual(BigInt("1000")?.description, "1000")
        XCTAssertEqual(BigInt("566543")?.description, "566543")
//        XCTAssertEqual(BigInt("56798416354")?.description, "56798416354")
//        XCTAssertEqual(BigInt("897312589698768463211189")?.description, "897312589698768463211189")
    }

}
