//
//  BTree.swift
//  SwiftProblems-99
//
//  Created by Barlow Tucker on 7/14/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Foundation

class BTree<T> {
    let value: T
    var left: BTree<T>?
    var right: BTree<T>?
    
    init(_ value: T, left: BTree<T>? = nil, right: BTree<T>? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    //MARK: - Internal Methods
    internal func numberOfNodes() -> Int {
        var number: Int = 0
        number += self.right != nil ? 1 : 0
        number += self.left != nil ? 1 : 0
        
        return number
    }
    
    //MARK: - Public Methods
    public func isCompletelyBalanced() -> Bool {
        
        return false
    }
}
