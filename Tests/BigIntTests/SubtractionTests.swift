//
//  SubtractionTests.swift
//  BigIntTests
//
//  Created by Soroush Khanlou on 3/16/18.
//  Copyright © 2018 Soroush Khanlou. All rights reserved.
//

import XCTest
@testable import BigInt

class SubtractionTests: XCTestCase {
    
    func testSimpleSubtraction() {
        let d1 = BigInt(words: [1, 2, 2, 2], sign: .positive)
        let d2 = BigInt(words: [1, 1, 1, 1], sign: .positive)

        let d3 = d1 - d2

        XCTAssertEqual(d3.words, [0, 1, 1, 1])
        XCTAssertEqual(d3.sign, .positive)

    }
    
}
