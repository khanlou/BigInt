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
        XCTAssertEqual(BigInt(1000).description, "1000")
    }

    func testIntInit() throws {
        XCTAssertEqual(BigInt(1000).words, [232, 3])
    }

    func testRoundTrip() throws {
        XCTAssertEqual(BigInt(-54656).description, "-54656")
        XCTAssertEqual(BigInt(1000).description, "1000")
        XCTAssertEqual(BigInt(1200).description, "1200")
        XCTAssertEqual(BigInt(2000).description, "2000")
        XCTAssertEqual(BigInt(53001).description, "53001")
        XCTAssertEqual(BigInt(65530).description, "65530")
        XCTAssertEqual(BigInt(110022).description, "110022")
        XCTAssertEqual(BigInt(233022).description, "233022")
        XCTAssertEqual(BigInt(433022).description, "433022")
        XCTAssertEqual(BigInt(566543).description, "566543")
        XCTAssertEqual(BigInt(56798416354).description, "56798416354")
        XCTAssertEqual(BigInt("897312589698768463211189")?.description, "897312589698768463211189")
    }

}
