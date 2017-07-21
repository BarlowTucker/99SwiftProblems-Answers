//
//  List.swift
//  SwiftProblems-99
//
//  Created by Barlow Tucker on 6/23/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Foundation

public class List<T> {
    var value: T
    var next: List<T>?
    weak var previous: List<T>?
    
    //MARK: - Initializers
    public convenience init!(_ values: T...) {
        self.init(Array(values))
    }
    
    init!(_ values: Array<T>) {
        var values = values
        if values.count == 0 {
            return nil
        }
        self.value = values.removeFirst()
        self.previous = nil
        self.next = List(values)
        self.next?.previous = self
    }
    
    //MARK: - Internal Methods
    internal func firstNode() -> List<T> {
        guard let previous = self.previous else { return self }
        return previous.firstNode()
    }
    
    internal func lastNode() -> List<T> {
        guard let next = self.next else { return self }
        return next.lastNode()
    }
    
    //MARK: - Public Methods
    public func addNode(_ node:List<T>) {
        let last = self.lastNode()
        last.next = node
        node.previous = last
    }
}

extension List:CustomStringConvertible {
    internal func string() -> String {
        guard let next = self.next else { return "\(self.value)" }
        return "\(self.value), " + next.string()
    }
    
    public var description: String {
        return "[\(self.string())]"
    }
}

//MARK: - Helpers
public extension List where T:Equatable {
    public static func == (lhs: List, rhs: List) -> Bool {
        guard lhs.length == rhs.length else { return false }
        
        for index in 0..<lhs.length {
            guard let left = lhs[index], let right = rhs[index], left == right else { return false }
        }
        
        return true
    }
}
//MARK: - Problem 1
public extension List {
    var last: T {
        guard let next = self.next else { return self.value }
        return next.last
    }
}
//MARK: - Problem 2
public extension List {
    var pennultimate: T? {
        guard let nextNext = self.next?.next else { return self.value }
        guard nextNext.next != nil else { return self.next?.value }
        return nextNext.pennultimate
    }
}
//MARK: - Problem 3
public extension List {
    public subscript(index: Int) -> T? {
        guard index >= 0 else { return nil }
        guard index != 0 else { return self.value }
        guard let next = self.next else { return nil }
        return next[index - 1]
    }
}
//MARK: - Problem 4
public extension List {
    internal func count(_ currentIndex: Int = 1) -> Int {
        guard let next = self.next else { return currentIndex }
        return next.count(currentIndex + 1)
    }
    
    var length: Int {
        return self.count()
    }
}
//MARK: - Problem 5
public extension List {
    public func reversed() -> List<T> {
        var currentNode = self.lastNode()
        let newFirst:List = List([currentNode.value])
        
        while let node = currentNode.previous {
            let newNode: List = List([node.value])
            newFirst.addNode(newNode)
            currentNode = node
        }
        
        return newFirst
    }
    
    public func reverse() {
        let reversed = self.reversed()
        self.value = reversed.value
        self.next = reversed.next
    }
}
//MARK: - Problem 6
public extension List where T:Equatable {
    public func isPalindrome() -> Bool {
        return self == self.reversed()
    }
}

//MARK: - Problem 7
public extension List {
    public func flatten() -> List<Any> {
        var returnList:List<Any>! = nil
        
        for index in 0..<self.length {
            guard let value = self[index] else { continue }
            let newNode: List<Any>
            if let list = value as? List {
                newNode = list.flatten()
            } else {
                newNode = List<Any>(value)
            }
            
            guard let list = returnList else { returnList = newNode; continue }
            list.addNode(newNode)
        }
        
        return returnList
    }
}

//MARK: - Problem 8
public extension List where T:Equatable {
    public func compress() {
        var current = self
        
        while let next = current.next {
            guard current.value != next.value else { current.next = next.next; continue }
            current = next
        }
    }
}
