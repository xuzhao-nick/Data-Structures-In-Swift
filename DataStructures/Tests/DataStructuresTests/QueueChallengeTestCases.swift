//
//  QueueChallengeTestCases.swift
//  
//
//  Created by nickxu on 28/9/20.
//

import XCTest
@testable import DataStructures


protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

// BoardGame includes an endless queue(round table)
extension QueueStack: BoardGameManager {
    typealias Player = T
    
    @discardableResult
    mutating func nextPlayer() -> Player? {
        guard let player = dequeue() else {
            return nil
        }
        enqueue(player)
        return player
    }
    
}

final class QueueChallengeTestCases: XCTestCase {
    func test_playerOrder() {
        var queue = QueueStack<String>()
        queue.enqueue("Kirby")
        queue.enqueue("Samus")
        queue.enqueue("Pikachu")
        queue.enqueue("Toon Ozma")
        XCTAssertEqual(queue.peek, "Kirby")
        queue.nextPlayer()
        queue.nextPlayer()
        XCTAssertEqual(queue.peek, "Pikachu")
        queue.nextPlayer()
        XCTAssertEqual(queue.peek, "Toon Ozma")
        queue.nextPlayer()
        XCTAssertEqual(queue.peek, "Kirby")
        
    }
}
