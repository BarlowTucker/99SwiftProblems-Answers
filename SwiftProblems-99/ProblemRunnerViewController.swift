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
            case 1: answer = self.run1()
            case 2: answer = self.run2()
            case 3: answer = self.run3()
            case 4: answer = self.run4()
            case 5: answer = self.run5()
            case 6: answer = self.run6()
            case 7: answer = self.run7()
            case 8: answer = self.run8()
            case 9: answer = self.run9()
            case 10: answer = self.run10()
            case 11: answer = self.run11()
            case 12: answer = self.run12()
            case 13: answer = self.run13()
            case 14: answer = self.run14()
            case 15: answer = self.run15()
            case 16: answer = self.run16()
            case 17: answer = self.run17()
            case 18: answer = self.run18()
            case 19: answer = self.run19()
            case 20: answer = self.run20()
            case 21: answer = self.run21()
            case 22: answer = self.run22()
            case 23: answer = self.run23()
            case 24: answer = self.run24()
            case 25: answer = self.run25()
            case 26: answer = self.run26()
            case 27: answer = self.run27()
            case 28: answer = self.run28()
            case 54: answer = self.run54()
            default: answer = "Unknown Problem Selected"
        }
        let isNilOrEmpty = (self.solutionTextView.string == nil) || self.solutionTextView.string!.isEmpty
        self.solutionTextView.string = isNilOrEmpty ? answer : answer + "\n" + self.solutionTextView.string!
        
    }
    @IBAction func problemChanged(_ sender: Any) {
    }

    //MARK: - Problem Runners
    //MARK: - Lists
    private func run1() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        return "Problem 1:\n--- The last item in the list 1, 1, 2, 3, 8 is: \(list.last)"
    }
    private func run2() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        let list2:List = List(1, 1, 2, 3, 5)
        let listAnswer:String = list.pennultimate == nil ? "Unknown" : "\(list.pennultimate!)"
        let list2Answer:String = list2.pennultimate == nil ? "Unknown" : "\(list2.pennultimate!)"
        return "Problem 2:\n--- The pennultimate of the list 1, 1, 2, 3, 5, 8 is \(listAnswer)\n--- The pennultimate of the list 1, 1, 2, 3, 5 is \(list2Answer)"
    }
    private func run3() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        let answer = list[2] == nil ? "Unknown" : "\(list[2]!)"
        return "Problem 3:\n--- The item at index 2 of the list 1, 1, 2, 3, 5, 8 is \(answer)"
    }
    private func run4() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        let answer = "\(list.length)"
        return "Problem 4:\n--- The length of the list 1, 1, 2, 3, 5, 8 is \(answer)"
    }
    private func run5() -> String {
        let list:List = List(1, 1, 2, 3, 5, 8)
        list.reverse()
        let answer = "\(list)"
        return "Problem 5:\n--- The list 1, 1, 2, 3, 5, 8 reversed is \(answer)"
    }
    private func run6() -> String {
        let list1:List = List(1, 1, 2, 3, 5, 8)
        let list2:List = List(1, 1, 2, 3, 2, 1, 1)
        let list3:List = List(1, 1, 2, 2, 1, 1)
        let answer1 = "\n--- The list \(list1) is\(list1.isPalindrome() ? "" : " not") a palindrome"
        let answer2 = "\n--- The list \(list2) is\(list2.isPalindrome() ? "" : " not") a palindrome"
        let answer3 = "\n--- The list \(list3) is\(list3.isPalindrome() ? "" : " not") a palindrome"
        
        return "Problem 6:\(answer1)\(answer2)\(answer3)"
    }
    private func run7() -> String {
        let list: List<Any> = List<Any>(List<Any>(1, 1), 2, List<Any>(3, List<Any>(5, 8))).flatten()
        
        return "Problem 7:\n--- The list List(List(1, 1), 2, List(3, List(5, 8))) flattened is \(list)"
    }
    private func run8() -> String {
        let list: List = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        list.compress()
        
        return "Problem 8:\n--- The list (a, a, a, a, b, c, c, a, a, d, e, e, e, e) compressed is \(list)"
    }
    private func run9() -> String {
        let list:List = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        return "Problem 9:\n--- List(\"a\", \"a\", \"a\", \"a\", \"b\", \"c\", \"c\", \"a\", \"a\", \"d\", \"e\", \"e\", \"e\", \"e\") packed is \(list.pack())"
    }
    private func run10() -> String {
        let list:List = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        return "Problem 10:\n--- List(\"a\", \"a\", \"a\", \"a\", \"b\", \"c\", \"c\", \"a\", \"a\", \"d\", \"e\", \"e\", \"e\", \"e\") encoded is \(list.encode())"
    }
    private func run11() -> String {
        let list:List = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        return "Problem 11:\n--- List(\"a\", \"a\", \"a\", \"a\", \"b\", \"c\", \"c\", \"a\", \"a\", \"d\", \"e\", \"e\", \"e\", \"e\") encoded (modified) is \(list.encodeModified())"
    }
    private func run12() -> String {
        let list:List = List((4, "a"), (1, "b"), (2, "c"), (2, "a"), (1, "d"), (4, "e"))
        return "Problem 12:\n--- List((4, \"a\"), (1, \"b\"), (2, \"c\"), (2, \"a\"), (1, \"d\"), (4, \"e\")) decoded is \(list.decode())"
    }
    private func run13() -> String {
        return "Problem 13:--- Not Implemented Yet"
    }
    private func run14() -> String {
        return "Problem 14:--- Not Implemented Yet"
    }
    private func run15() -> String {
        return "Problem 15:--- Not Implemented Yet"
    }
    private func run16() -> String {
        return "Problem 16:--- Not Implemented Yet"
    }
    private func run17() -> String {
        return "Problem 17:--- Not Implemented Yet"
    }
    private func run18() -> String {
        return "Problem 18:--- Not Implemented Yet"
    }
    private func run19() -> String {
        return "Problem 19:--- Not Implemented Yet"
    }
    private func run20() -> String {
        return "Problem 20:--- Not Implemented Yet"
    }
    private func run21() -> String {
        return "Problem 21:--- Not Implemented Yet"
    }
    private func run22() -> String {
        return "Problem 22:--- Not Implemented Yet"
    }
    private func run23() -> String {
        return "Problem 23:--- Not Implemented Yet"
    }
    private func run24() -> String {
        return "Problem 24:--- Not Implemented Yet"
    }
    private func run25() -> String {
        return "Problem 25:--- Not Implemented Yet"
    }
    private func run26() -> String {
        return "Problem 26:--- Not Implemented Yet"
    }
    private func run27() -> String {
        return "Problem 27:--- Not Implemented Yet"
    }
    private func run28() -> String {
        return "Problem 28:--- Not Implemented Yet"
    }
    
    //MARK: - Binary Trees
    private func run54() -> String {
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

