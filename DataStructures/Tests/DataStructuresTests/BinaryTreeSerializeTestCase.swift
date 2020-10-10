//
//  File.swift
//  
//
//  Created by Nick Xu on 10/10/20.
//

import Foundation
import XCTest
@testable import DataStructures

final class BinaryTreeSerializeTestCase: XCTestCase {
    var tree: BinaryNode<Int> = {
        let seven = BinaryNode(value: 7)
        let one = BinaryNode(value: 1)
        let nine = BinaryNode(value: 9)
        let zero = BinaryNode(value: 0)
        let five = BinaryNode(value: 5)
        let eight = BinaryNode(value: 8)
        
        seven.leftChild = one
        seven.rightChild = nine
        one.leftChild = zero
        one.rightChild = five
        nine.leftChild = eight
        
        return seven
    }()
    
    func test_traverseMid() {
        print(tree.description)
    }
    
    func test_serialize() {
        let testArray = tree.serialize()
        XCTAssertEqual(testArray, [7,1,0,nil,nil,5,nil,nil,9,8,nil,nil,nil])
    }
    
    func test_deserialize() {
        let theTree = BinaryNode(value: 0)
        theTree.deserialize([7,1,0,nil,nil,5,nil,nil,9,8,nil,nil,nil])
        let testArray = theTree.serialize()
        XCTAssertEqual(testArray, [7,1,0,nil,nil,5,nil,nil,9,8,nil,nil,nil])
    }
    
    
}
