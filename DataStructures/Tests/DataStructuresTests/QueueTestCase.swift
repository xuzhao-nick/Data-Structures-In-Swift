//
//  QueueTestCase.swift
//  
//
//  Created by Nick Xu on 27/9/20.
//

import XCTest
@testable import DataStructures

final class QueueTestCase: XCTestCase {
    var queueArray = QueueArray<String>()
    override func setUp() {
        queueArray.enqueue("Pusheen")
        queueArray.enqueue("Keyboard Cat")
        queueArray.enqueue("Lil Bub")
    }
    
    func test_enqueueArray() {
        XCTAssertEqual(queueArray.peek, "Pusheen")
    }
    
    func test_enqueueStack() {
        
    }
    
    func test_dequeueArray() {
        queueArray.dequeue()
        queueArray.dequeue()
        XCTAssertEqual(queueArray.peek, "Lil Bub")
        queueArray.dequeue()
        XCTAssertTrue(queueArray.isEmpty)
    }
    
    func test_dequeueStack() {
        
    }
}
