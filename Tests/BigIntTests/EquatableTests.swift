//
//  EquatableTEsts.swift
//  BigIntTests
//
//  Created by Anat Gilboa on 3/17/18.
//  Copyright © 2018 Soroush Khanlou. All rights reserved.
//

import XCTest
@testable import BigInt

class EquatableTests: XCTestCase {
    
    func testTwoBigIntsAreEqual() {
        let d1 = BigInt(words: [1, 1, 1], sign: .positive)
        let d2 = BigInt(words: [1, 1, 1], sign: .positive)
        
        XCTAssertEqual(d1.words, d2.words)
        XCTAssertEqual(d1.sign, d2.sign)
        XCTAssertEqual(d1, d2)
    }
        
    func testTwoBigIntsAreNotEqualInSign() {
        let d1 = BigInt(words: [1, 1, 1], sign: .positive)
        let d2 = BigInt(words: [1, 1, 1], sign: .negative)
        
        XCTAssertEqual(d1.words, d2.words)
        XCTAssertNotEqual(d1.sign, d2.sign)
        XCTAssertNotEqual(d1, d2)
    }
    
    func testTwoBigIntsAreNotEqualWords() {
        let d1 = BigInt(words: [1, 1, 1], sign: .positive)
        let d2 = BigInt(words: [1, 1, 2], sign: .positive)
        
        XCTAssertNotEqual(d1.words, d2.words)
        XCTAssertEqual(d1.sign, d2.sign)
        XCTAssertNotEqual(d1, d2)
    }

    func testTwoBigIntsAreNotEqualInSignAndWords() {
        let d1 = BigInt(words: [1, 1, 1], sign: .positive)
        let d2 = BigInt(words: [1, 1, 2], sign: .negative)
        
        XCTAssertNotEqual(d1.words, d2.words)
        XCTAssertNotEqual(d1.sign, d2.sign)
        XCTAssertNotEqual(d1, d2)
    }

    func testTwoBigIntsAreNotEqualInSignAndDecimalPosition() {
        let d1 = BigInt(words: [1, 1, 1], sign: .positive)
        let d2 = BigInt(words: [1, 1, 1], sign: .negative)
        
        XCTAssertEqual(d1.words, d2.words)
        XCTAssertNotEqual(d1.sign, d2.sign)
        XCTAssertNotEqual(d1, d2)
    }

    func testTwoBigIntsAreNotEqualInWordsAndDecimalPosition() {
        let d1 = BigInt(words: [1, 1, 1], sign: .positive)
        let d2 = BigInt(words: [1, 1, 2], sign: .positive)
        
        XCTAssertNotEqual(d1.words, d2.words)
        XCTAssertEqual(d1.sign, d2.sign)
        XCTAssertNotEqual(d1, d2)
    }
    
    func testTwoBigIntsAreNotEqual() {
        let d1 = BigInt(words: [1, 1, 1], sign: .positive)
        let d2 = BigInt(words: [1, 1, 2], sign: .negative)
        
        XCTAssertNotEqual(d1.words, d2.words)
        XCTAssertNotEqual(d1.sign, d2.sign)
        XCTAssertNotEqual(d1, d2)
    }


}
