//
//  File.swift
//  
//
//  Created by Nick Xu on 30/9/20.
//

class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
}
