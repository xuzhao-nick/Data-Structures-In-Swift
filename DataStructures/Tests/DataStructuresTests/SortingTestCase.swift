//
//  File.swift
//  
//
//  Created by Nick Xu on 29/9/20.
//

import XCTest
@testable import DataStructures

final class SortingTestCase: XCTestCase {
    var testArray:[Int] = []
    let sortedArray = [2, 3, 3, 4, 6, 7, 9, 11, 15]
    override func setUp() {
        testArray = [7, 2, 6, 3, 3, 9, 15, 4, 11]
    }
    
    func test_bubbleSort() {
        bubbleSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
    
    func test_selectionSort() {
        selectionSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
    
    func test_insertionSort() {
        insertionSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
    
    func test_mergeSort() {
        XCTAssertEqual(mergeSort(testArray), sortedArray)
    }
}
