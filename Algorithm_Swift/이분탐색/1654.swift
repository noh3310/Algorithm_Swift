//
//  1654.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/10/31.
//

import Foundation

// 이분탐색
func binarySearch(target: Int, maxLength: Int, arr: [Int]) -> Int {
    var start = 0
    var end = maxLength + 1
    var result = 0
    
    while(start < end) {
        let mid = (start + end) / 2
        var sum = 0
        arr.forEach { sum += $0 / mid }
        
        if sum >= target {    // 개수가 많은 경우는 크기가 작게 잘렸기 때문이므로 start를 옮겨줌
            start = mid + 1
            result = mid
        } else if sum < target {
            end = mid
        }
    }
    return result
}

let number = readLine()!.components(separatedBy: " ").map { Int($0)! }

let K = number[0]
let N = number[1]

var pipeList: [Int] = []
var maxLength = 0

for _ in 0..<K {
    let pipe = Int(readLine()!)!
    pipeList.append(pipe)
    maxLength = pipe > maxLength ? pipe : maxLength
}

//print(pipeList)
//print(maxLength)

let result = binarySearch(target: N, maxLength: maxLength, arr: pipeList)

print(result)
