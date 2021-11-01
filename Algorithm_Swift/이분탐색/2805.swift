//
//  2805.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/01.
//

import Foundation

// 상근이가 가져갈 수 있는 양
func calculateGetAmount(height: Int) -> Int {
    var result = 0
    trees.forEach { value in
        result += value > height ? value - height : 0
    }
    return result
}

// 이분탐색
func binarySearch(targetAmount: Int, maxValue: Int) -> Int {
    var start = 0
    var end = maxValue
    var mid = (start + end) / 2
    
    while start <= end {
        let currentAmount = calculateGetAmount(height: mid)

        if currentAmount >= targetAmount {
            start = mid + 1
        } else if currentAmount < targetAmount {
            end = mid - 1
        }
        mid = (start + end) / 2
    }
    return mid
}

let number = readLine()!.components(separatedBy: " ")

let N = Int(number[0])!
let M = Int(number[1])!

// Int 배열로 변환
//let trees = readLine()!.components(separatedBy: " ").map { Int($0)! }
let trees = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

var maxValue = 1000000000

let result = binarySearch(targetAmount: M, maxValue: maxValue)

print(result)
