//
//  ViewController.swift
//  KKBCCloundManager
//
//  Created by 王绵杰 on 2017/1/13.
//  Copyright © 2017年 王绵杰. All rights reserved.
//

import UIKit

// 枚举定义
enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

enum ServerResponse {
    case result(String,String)
    case failure(String)
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
            ]
        var largest = 0
        
        var ttype : String? = "Square"
        
        for (kind, numbers) in interestingNumbers {
            ttype = kind
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
        print(" \(ttype!)有最大值：\(largest)")
        
        let re =  greet(person: "Bob", day: "Tuesday")
        print(re)
        let increment = makeIncrementer()
        let ts = increment(7)
        print(ts)
        let numbers = [20, 19, 7, 12]
        let num = numbers.map({
            (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        print(num)
        // When a closure's type is already known, such as the callback for a delegate, you can omit 
        // the type of its parameters,its return type, or both.
        let omitNum = numbers.map({number in 3 * number})
        print("omitNum \(omitNum)")
        // When a closure is the only argument to a function,you can omit the parentheses entirely.
        let sortedNumbers = omitNum.sorted { $0 > $1}
        print(sortedNumbers)
        
        let hearts = Suit.hearts
        let heartsDescription = hearts.simpleDescription()
        print(heartsDescription)
        
        let success = ServerResponse.result("6:00 am", "8:09 pm")
        _ = ServerResponse.failure("Out of cheese.")
        
        switch success {
        case let .result(sunrise, sunset):
            print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
        case let .failure(message):
            print("Failure...  \(message)")
        }
//        Swift’s nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. 
//        In Swift, nil is not a pointer—it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.
        // If an implicitly unwrapped optional is nil and you try to access its wrapped value, you’ll trigger a runtime error. The result is exactly the same as if you place an exclamation mark after a normal optional that does not contain a value.
        // 不管是 显示Optional还是隐式的 一旦参数为空，如果强制解包那么会出发runtime error
        var surveyAnswer: String?
        
        
    }
    
    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    // 方法里可以再嵌套方法
    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    // 方法可以作为返回值
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    // 方法可以作为参数
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

