//
//  main.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/10/09.
//

import Foundation

func dfs(currentNumber: Int, N: Int, x: Int, y: Int) {
    if x == r && y == c {
        print(currentNumber)
        return
    }
    
    let addNumber = Int(pow(Double(2),Double(N - 1)))
    let positionNumber = addNumber * addNumber
    
    if r < x + addNumber && c < y + addNumber {
        dfs(currentNumber: currentNumber, N: N - 1, x: x, y: y)
    } else if r < x + addNumber && c >= y + addNumber {
        dfs(currentNumber: currentNumber + positionNumber, N: N - 1, x: x, y: y + addNumber)
    } else if r >= x + addNumber && c < y + addNumber {
        dfs(currentNumber: currentNumber + positionNumber * 2, N: N - 1, x: x + addNumber, y: y)
    } else if r >= x + addNumber && c >= y + addNumber {
        dfs(currentNumber: currentNumber + positionNumber * 3, N: N - 1, x: x + addNumber, y: y + addNumber)
    }
}

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }

let N = numbers[0]
let r = numbers[1]
let c = numbers[2]

dfs(currentNumber: 0, N: N, x: 0, y: 0)
