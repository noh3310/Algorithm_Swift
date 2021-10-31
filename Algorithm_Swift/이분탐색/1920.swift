//
//  1920.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/10/31.
//

import Foundation

// 이분탐색
func binarySearch(target: Int, arr: [Int]) -> Bool {
    var start = 0
    var end = arr.count - 1
    var mid = (start + end) / 2
    
    while(start <= end) {
        if arr[mid] == target {
            return true
        } else if arr[mid] > target {
            end = mid - 1
        } else if arr[mid] < target {
            start = mid + 1
        }
        mid = (start + end) / 2
    }
    // 만약 찾지 못하면 false 리턴
    return false
}

var arr: [Int] = []

var N = readLine()!
let number = readLine()!

number.components(separatedBy: " ").forEach { arr.append(Int($0)!) }

arr.sort()

let findNumberCount = readLine()!

let findNumber = readLine()?.components(separatedBy: " ").map { Int($0)! }

var resultList: [Int] = []
if let findNumber = findNumber {
    for index in findNumber.indices {
        let result = binarySearch(target: findNumber[index], arr: arr) ? 1 : 0
        resultList.append(result)
    }
}

resultList.forEach { print($0) }
