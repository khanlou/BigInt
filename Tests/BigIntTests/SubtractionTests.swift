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
        let d1 = BigInt(33686017)
        let d2 = BigInt(16843009)

        let d3 = d1 - d2

        XCTAssertEqual(d3.description, "16843008")

    }
    
}
