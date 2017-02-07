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
//        If an implicitly unwrapped optional is nil and you try to access its wrapped value, you’ll trigger a runtime error.
//        The result is exactly the same as if you place an exclamation mark after a normal optional that does not contain a value.
        // 不管是 显示Optional还是隐式的 一旦参数为空，如果强制解包那么会出发runtime error
        var surveyAnswer: String?
        surveyAnswer = "survey"
        print(surveyAnswer!)
        
//        Tuples are compared from left to right, one value at a time, until the comparison finds two values that aren’t equal.
        if (1,"apple") < (1,"bird") {
            print("yes")
        }
//        the operator is used to determine an initial value for a String variable called colorNameToUse.
//        Because userDefinedColorName is nil, the expression userDefinedColorName ?? defaultColorName returns the value of defaultColorName, or "red".
        let defaultColorName = "red"
        var userDefinedColorName: String?
        var colorNameToUse = userDefinedColorName ?? defaultColorName
        userDefinedColorName = "green"
        var colorName = userDefinedColorName ?? defaultColorName
        // userDefineColorName is not nil, so colorNameToUse is set to "green"
        print("\(colorNameToUse)  \(colorName)")
        
        
        let count = 6
        for i in 0...6 {
            print(i)
        }
        
        for i in 0..<count {
            print(i)
        }
        
        var shoppingList = ["Eggs","Milk"]
        if shoppingList.isEmpty {
            print("Empty")
        }else{
            print("Not Empty")
        }
        shoppingList.append("Flour")
        shoppingList += ["Baking Powder"] // now shoppingList contains 4 items
        shoppingList += ["Chocolate Spread","Cheese","Butter"] // now shoppingList contains 7 items
        
        for (index,value) in shoppingList.enumerated() {
            print("Item: \(index+1):\(value)")
        }
        
        let anotherCharacter: Character = "a"
        switch anotherCharacter {
        case "a","A":
            print("the letter A")
        default:
            print("Not the letter A")
        }
        
        let somePoint = (1,1)
        switch somePoint {
        case (0,0):
            print("(0,0) is at the origin")
        case (_,0):
            print("(\(somePoint.0),0) is on the x-axis")
        case (0,_):
            print("(\(0,somePoint.1)) is on the y-axis")
        case (-2...2,-2...2):
            print("(\(somePoint.0),\(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0),\(somePoint.1)) is outside of the box")
        }
        
        
    }
    // a guard statement,like an if statement,executes statements depending on the Boolean
    // value of an expression. You use a guard statement to requre that a condition must be true in order for
    // the code after the guard statement to be executed. Unlike an if statement,a guard statement always has an else clause
    func greet(person:[String: String]) {
        guard person["name"] != nil else {
            return
        }
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

