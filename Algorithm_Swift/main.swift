//
//  main.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/10/09.
//

import Foundation

// 스택 수열
func stackNumbers(numberList: [Int]) -> [String] {
    var stack = [Int]()
    
    var resultArray = [String]()
    
    // 인풋 순서 인덱스
    var numberIndex = 1

    // 출력되어야할 숫자 인덱스
    var printNumberIndex = 0

    while numberIndex <= N {
        let top = stack.count == 0 ? -1 : stack[stack.count - 1]
        
        // 스택의 top에 있는 값이 출력해야할 값이라면 pop 해줌
        if top != -1 && top == numberList[printNumberIndex] {
            // 스택의 pop과 같음
            stack.removeLast()
            printNumberIndex += 1
            resultArray.append("-")
        }
        // 스택에 값이 아니라면 push 해줌
        else {
            stack.append(numberIndex)
            numberIndex += 1
            resultArray.append("+")
        }
    }

    while !stack.isEmpty {
        let value = stack.removeLast()
        if value == numberList[printNumberIndex] {
            printNumberIndex += 1
            resultArray.append("-")
        } else {
            return []
        }
    }
    return resultArray
}

let N = Int(readLine()!)!

var numberList = [Int]()
for _ in 0..<N {
    let number = Int(readLine()!)!
    numberList.append(number)
}

let result = stackNumbers(numberList: numberList)

if result.count == 0 {
    print("NO")
} else {
    result.forEach { print($0) }
}
