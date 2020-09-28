//
//  File.swift
//  
//
//  Created by Nick Xu on 29/9/20.
//

import XCTest
@testable import DataStructures

final class SortingTestCase: XCTestCase {
    var testArray: [Int] = []
    let sortedArray = [3, 4, 9, 10]
    
    override func setUp() {
        testArray = [9, 4, 10, 3]
    }
    
    func test_bubbleSort() {
        bubbleSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
}
