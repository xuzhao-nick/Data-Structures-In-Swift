//
//  File.swift
//  
//
//  Created by Nick Xu on 26/9/20.
//

import Foundation
// TODO: Implement Stack
struct Stack<Element: Equatable> :Equatable{
    private var storage: [Element] = []
    
    init() {}
    
    init(_ elements: [Element]) {
        storage = elements
    }
    
    var isEmpty: Bool {
        return peek() == nil
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    func peek() -> Element? {
        return storage.last
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return storage
        .map {"\($0)"}
        .joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
    
    
}
