//
//  18111.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/06.
//

import Foundation

func workingTime(_ target: Int, value: Int) -> Int {
    var result = 0
    var amount = value
    
    for i in blockList.indices {
        for j in blockList[i].indices {
            // 블록이 타겟보다 크다면 * 2로 빼줘야함
            if blockList[i][j] > target {
                amount += blockList[i][j] - target
                result += (blockList[i][j] - target) * 2
            }
            // 블록이 타겟보다 작다면 * 1로 더해줘야함
            else if blockList[i][j] < target {
                amount -= target - blockList[i][j]
                result += target - blockList[i][j]
            }
        }
    }
    if amount >= 0 {
        return result
    } else {
        return -1
    }
}

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }

let N = numbers[0]
let M = numbers[1]
let B = numbers[2]

var blockList: [[Int]] = Array(repeating: [], count: N)

// 블록에 넣어줌
for index in 0..<N {
    let line = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    blockList[index] = line
}

var resultTime = Int.max
var resultHeight = 0
for target in 0...256 {
    let time = workingTime(target, value: B)
    
    // 시간이 0보다 작다면 만들 수 없는 것임
    if time < 0 {
        continue
    }
    
    // 만약 결과값 시간보다 같거나 작은 경우
    if time <= resultTime {
        resultTime = time
        resultHeight = target
    }
}

print("\(resultTime) \(resultHeight)")
