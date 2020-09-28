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
    var queueStack = QueueStack<String>()
    override func setUp() {
        queueArray.enqueue("Pusheen")
        queueArray.enqueue("Keyboard Cat")
        queueArray.enqueue("Lil Bub")
        
        queueStack.enqueue("Milo")
        queueStack.enqueue("Sassy")
        queueStack.enqueue("Ozma")
    }
    
    func test_enqueueArray() {
        XCTAssertEqual(queueArray.peek, "Pusheen")
    }
    
    func test_enqueueStack() {
        XCTAssertEqual(queueStack.peek, "Milo")
        
    }
    
    func test_dequeueArray() {
        queueArray.dequeue()
        queueArray.dequeue()
        XCTAssertEqual(queueArray.peek, "Lil Bub")
        queueArray.dequeue()
        XCTAssertTrue(queueArray.isEmpty)
    }
    
    func test_dequeueStack() {
        queueStack.dequeue()
        queueStack.dequeue()
        XCTAssertEqual(queueStack.peek, "Ozma")
        queueStack.dequeue()
        XCTAssertTrue(queueStack.isEmpty)
    }
}
