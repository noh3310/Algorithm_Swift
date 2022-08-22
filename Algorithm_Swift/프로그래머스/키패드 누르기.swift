//
//  키패드 누르기.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/08/22.
//

import Foundation

let dict = [1: [0, 0], 2: [0, 1], 3: [0, 2],
            4: [1, 0], 5: [1, 1], 6: [1, 2],
            7: [2, 0], 8: [2, 1], 9: [2, 2],
            0: [3, 1], -1: [3, 0], -2: [3, 2]]

func solution(_ numbers:[Int], _ hand:String) -> String {
    var left = -1
    var right = -2
    var result = ""
    
    for i in 0..<numbers.count {
        // 1, 4, 7
        if numbers[i] == 1 || numbers[i] == 4 || numbers[i] == 7 {
            result += "L"
            left = numbers[i]
            continue
        }
        
        // 3, 6, 9
        if numbers[i] == 3 || numbers[i] == 6 || numbers[i] == 9 {
            result += "R"
            right = numbers[i]
            continue
        }
        
        // 여기서 메인 알고리즘
        // 2, 5, 8, 0일 때
        let leftDist = distance(dict[left]!, dict[numbers[i]]!)
        let rightDist = distance(dict[right]!, dict[numbers[i]]!)
        
        if leftDist < rightDist {
            left = numbers[i]
            result += "L"
        } else if leftDist > rightDist {
            right = numbers[i]
            result += "R"
        } else {
            if hand == "left" {
                left = numbers[i]
                result += "L"
            } else {
                right = numbers[i]
                result += "R"
            }
        }
    }
    return result
}

func distance(_ start: [Int], _ end: [Int]) -> Int {
    return abs(start[0] - end[0]) + abs(start[1] - end[1])
}

func handPos(_ hand: String) -> Int {
    return hand == "left" ? 0 : 1
}

//let numbers = [1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5]
//let hand = "right"
//// "LRLLLRLLRRL"

//let numbers = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
//let hand = "left"
//// "LRLLRRLLLRR"

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
let hand = "right"
// "LLRLLRLLRL"

let result = solution(numbers, hand)

print(result)
