//
//  EquatableTEsts.swift
//  BigIntTests
//
//  Created by Anat Gilboa on 3/17/18.
//  Copyright © 2018 Soroush Khanlou. All rights reserved.
//

import XCTest
import BigInt

class EquatableTests: XCTestCase {
    
    func testTwoBigIntsAreEqual() {
        XCTAssertEqual(BigInt(1234), BigInt(1234))
        XCTAssertEqual(BigInt(-134), BigInt(-134))
        XCTAssertEqual(BigInt(564654), BigInt(564654))
        XCTAssertEqual(BigInt(897496541), BigInt(897496541))
        XCTAssertEqual(BigInt("781653463516548616556"), BigInt("781653463516548616556"))
        XCTAssertNotEqual(BigInt(564654) + BigInt(1), BigInt(564654))
        XCTAssertEqual(BigInt(564654) + BigInt(0), BigInt(564654))
    }

}
