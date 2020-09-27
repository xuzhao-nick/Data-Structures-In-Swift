//
//  StackTestParentheses.swift
//  
//
//  Created by Nick Xu on 26/9/20.
//
import XCTest
import Foundation
@testable import DataStructures

func checkParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    for letter in string {
        if letter == "(" {
            stack.push(letter)
        }
        else if letter == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
            
        }
    }
    return stack.isEmpty
}


final class StackChallengeTestCase: XCTestCase {
    func test_checkParents() {
        XCTAssertTrue(checkParentheses("()"))
    }
    
    func test_checkParens1() {
        XCTAssertTrue(checkParentheses("hello(world)()"))
    }
    
    func test_checkParens2() {
        XCTAssertFalse(checkParentheses("(hello world"))
    }
    
    func test_checkParens3() {
        XCTAssertFalse(checkParentheses("((())(meow)))()))"))
    }
    
}
