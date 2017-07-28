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
    var next: List<T>? {
        didSet {
            next?.previous = self
        }
    }
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

public extension List {
    public func cast<V>() -> List<V>? {
        return self.flatMap({ $0 as? V })
    }
    
    public func copy() -> List {
        return self.map({ $0 })
    }
    
    public func map<V>(_ map: (_ value: T) -> V) -> List<V> {
        let newSelf = List<V>(map(self.value))!
        newSelf.next = self.next?.map(map)
        return newSelf
    }
    
    public func flatMap<V>(_ map: (_ value: T) -> V?) -> List<V>? {
        guard let mappedValue = map(self.value) else { return self.next?.flatMap(map) }
        let newSelf = List<V>(mappedValue)!
        newSelf.next = self.next?.flatMap(map)
        return newSelf
    }
    
    public func add(_ n:Int, of value:T) {
        guard n > 0 else { return }
        self.lastNode().next = List(value)
        self.add(n - 1, of:value)
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

//MARK: - Problem 9
public extension List where T:Equatable {
    public func pack() -> List<List<T>> {
        var currentList:List<T> = List(self.value)
        let packedList:List<List<T>> = List<List<T>>(currentList)
        
        var current = self
        
        while let next = current.next {
            let newList:List<T> = List(next.value)
            
            if current.value == next.value {
                currentList.addNode(newList)
            } else {
                currentList = newList
                packedList.addNode(List<List<T>>(currentList))
            }

            current = next
        }
        
        return packedList
    }
}

//MARK: - Problem 10
public extension List where T:Equatable {
    public func encode() -> List<(Int, T)> {
        return self.pack().map { ($0.length, $0.value) }
    }
}

//MARK: - Problem 11
public extension List where T:Equatable {
    public func encodeModified() -> List<Any> {
        let encoded:List<Any> = self.pack().map { $0.length > 1 ? ($0.length, $0.value) as Any : $0.value as Any }
        return encoded
    }
}

//MARK: - Problem 12
public extension List {
    public func decode() -> List<String> {
        var newList: List<String>! = nil
        var current:List<T>? = self
        
        while let value = current?.value as? (Int, String) {
            let currentList: List<String> = List<String>(value.1)
            
            if newList != nil {
                newList.lastNode().next = currentList
            } else {
                newList = currentList
            }
            
            currentList.add(value.0 - 1, of: value.1)
            
            current = current?.next
        }
        
        return newList
    }
}

//MARK: - Problem 13
public extension List where T:Equatable {
    
}

//MARK: - Problem 14 & 15
public extension List {
    
}

//MARK: - Problem 16
public extension List {
    
}

//MARK: - Problem 17
public extension List {
    
}

//MARK: - Problem 18
public extension List {
    
}

//MARK: - Problem 19
public extension List {
    
}

//MARK: - Problem 20
public extension List {
    
}

//MARK: - Problem 21
public extension List {
    
}

//MARK: - Problem 22
public extension List {
    
}

//MARK: - Problem 23
public extension List {
    
}

//MARK: - Problem 24
public extension List {
    
}

//MARK: - Problem 25
public extension List {
    
}

//MARK: - Problem 26
public extension List {
    
}

//MARK: - Problem 26B
public extension List {
    
}

//MARK: - Problem 27
public extension List {
    
}

//MARK: - Problem 27B
public extension List {
    
}

//MARK: - Problem 28
public extension List {
    
}

//MARK: - Problem 28B
public extension List {
    
}

//MARK: - Apendix1A
//extension List: SequenceType {
//    
//}
