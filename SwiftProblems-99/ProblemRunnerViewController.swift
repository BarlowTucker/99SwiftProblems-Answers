//
//  ViewController.swift
//  SwiftProblems-99
//
//  Created by Barlow Tucker on 6/23/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Cocoa

class ProblemRunnerViewController: NSViewController {
    @IBOutlet weak var problemSelector: NSPopUpButton!
    @IBOutlet var solutionTextView: NSTextView!
    @IBOutlet var arrayController: NSArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrayController.content = self.problems()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func runClicked(_ sender: Any) {
        let answer:String
        switch self.problemSelector.indexOfSelectedItem + 1 {
            case 1: answer = self.runOne()
            case 2: answer = self.runTwo()
            case 3: answer = self.runThree()
            case 4: answer = self.runFour()
            case 5: answer = self.runFive()
            case 6: answer = self.runSix()
            case 7: answer = self.runSeven()
            case 8: answer = self.runEight()
            case 54: answer = self.runFiftyFour()
            default: answer = "Unknown Problem Selected"
        }
        let isNilOrEmpty = (self.solutionTextView.string == nil) || self.solutionTextView.string!.isEmpty
        self.solutionTextView.string = isNilOrEmpty ? answer : answer + "\n" + self.solutionTextView.string!
        
    }
    @IBAction func problemChanged(_ sender: Any) {
    }

    //MARK: - Problem Runners
    //MARK: - Lists
    private func runOne() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        return "Problem 1:\n--- The last item in the list 1, 1, 2, 3, 8 is: \(list.last)"
    }
    private func runTwo() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        let list2:List = List(1, 1, 2, 3, 5)
        let listAnswer:String = list.pennultimate == nil ? "Unknown" : "\(list.pennultimate!)"
        let list2Answer:String = list2.pennultimate == nil ? "Unknown" : "\(list2.pennultimate!)"
        return "Problem 2:\n--- The pennultimate of the list 1, 1, 2, 3, 5, 8 is \(listAnswer)\n--- The pennultimate of the list 1, 1, 2, 3, 5 is \(list2Answer)"
    }
    private func runThree() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        let answer = list[2] == nil ? "Unknown" : "\(list[2]!)"
        return "Problem 3:\n--- The item at index 2 of the list 1, 1, 2, 3, 5, 8 is \(answer)"
    }
    private func runFour() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        let answer = "\(list.length)"
        return "Problem 4:\n--- The length of the list 1, 1, 2, 3, 5, 8 is \(answer)"
    }
    private func runFive() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        list.reverse()
        let answer = "\(list)"
        return "Problem 5:\n--- The list 1, 1, 2, 3, 5, 8 reversed is \(answer)"
    }
    private func runSix() -> String {
        let list1:List = List(1, 1, 2, 3, 5, 8)
        let list2:List = List(1, 1, 2, 3, 2, 1, 1)
        let list3:List = List(1, 1, 2, 2, 1, 1)
        let answer1 = "\n--- The list \(list1) is\(list1.isPalindrome() ? "" : " not") a palindrome"
        let answer2 = "\n--- The list \(list2) is\(list2.isPalindrome() ? "" : " not") a palindrome"
        let answer3 = "\n--- The list \(list3) is\(list3.isPalindrome() ? "" : " not") a palindrome"
        
        return "Problem 6:\(answer1)\(answer2)\(answer3)"
    }
    private func runSeven() -> String {
        let list: List<Any> = List<Any>(List<Any>(1, 1), 2, List<Any>(3, List<Any>(5, 8))).flatten()
        
        return "Problem 7:\n--- The list List(List(1, 1), 2, List(3, List(5, 8))) flattened is \(list)"
    }
    private func runEight() -> String {
        let list: List = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        list.compress()
        
        return "Problem 8:\n--- The list (a, a, a, a, b, c, c, a, a, d, e, e, e, e) compressed is \(list)"
    }
    //MARK: - Binary Trees
    private func runFiftyFour() -> String {
        let balanced = BTree("a", left: BTree("b", left: BTree("d"), right: BTree("e")), right: BTree("c", right: BTree("f", left: BTree("g"))))
        let unBalanced = BTree("a", left: BTree("b", left: BTree("d"), right: BTree("e")), right: BTree("c", right: BTree("f", left: BTree("g"))))
        
        return "Not Implemented"
    }
    
    //MARK: - Building Problems List
    private func problems() -> [[String:String]] {
        var array: [[String:String]] = []
        for number in 1...99 {
            array.append(["name":"Problem \(number)", "value":"\(number)"])
        }
        return array
    }
    
    
}

