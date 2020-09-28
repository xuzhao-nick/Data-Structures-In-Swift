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
        print(queue.description)
        XCTAssertEqual(queue.peek, "Kirby")
        queue.nextPlayer()
        print(queue.description)
        queue.nextPlayer()
        print(queue.description)
        XCTAssertEqual(queue.peek, "Pikachu")
        queue.nextPlayer()
        queue.enqueue("Toon Ozma")
    }
}
