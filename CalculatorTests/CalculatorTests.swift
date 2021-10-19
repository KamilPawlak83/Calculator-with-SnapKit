//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Kamil Pawlak on 15/10/2021.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    func testAddNumbers() {
        let tester = CalculatorManager()
        let result = tester.addNumbers(x: 1, y: 3)
        XCTAssertEqual(result, 4)
    }
    
    func testMultiplyNumbers() {
        let tester = CalculatorManager()
        let result = tester.multiplyNumbers(x: 2, y: 5)
        XCTAssertEqual(result, 10)
    }
    
    func testSubtractNumbers() {
        let tester = CalculatorManager()
        let result = tester.subtractNumbers(x: 4, y: 2)
        XCTAssertEqual(result, 2)
    }
    

   
}
