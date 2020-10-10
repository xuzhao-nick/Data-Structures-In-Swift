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

extension BinaryNode {
    func serialize() -> [Element?] {
        var array:[Element?] = []
        self.traversePreOrderIncludeNil {array.append($0 as Element?)}
        return array
    }
    func deserialize(_ array:[Element?]) {
        var index = 0
        self.traverseConstruct(index: &index, array: array)
    }
    
    func traverseConstruct(index:inout Int, array:[Element?]) {
        guard index < array.count else {
            return
        }
        if let theValue = array[index] {
            self.value = theValue
        }
        index += 1
        if index < array.count {
            if let theValue = array[index]  {
                self.leftChild = BinaryNode(value: theValue)
                self.leftChild?.traverseConstruct(index: &index, array: array)
            }
        }
        index += 1
        if index < array.count {
            if let theValue = array[index]  {
                self.rightChild = BinaryNode(value:theValue)
                self.rightChild?.traverseConstruct(index: &index, array: array)
            }
        }
        
    }
    
    
    func traversePreOrderIncludeNil(visit: (Element?) -> Void) {
        visit(value)
        if let left = self.leftChild {
            left.traversePreOrderIncludeNil(visit:visit)
        } else {
            visit(nil)
        }
        if let right =  self.rightChild {
            right.traversePreOrderIncludeNil(visit:visit)
        } else {
            visit(nil)
        }
    }
}

extension BinaryNode {
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}


extension BinaryNode: CustomStringConvertible {
  //Note: This algorithm is based on an implementation by Károly Lőrentey in his book Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.

  public var description: String {
    return diagram(for: self)
  }

  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild,
                   top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild,
                bottom + "│ ", bottom + "└──", bottom + " ")
  }
}
