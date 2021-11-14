//
//  2579.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/14.
//

import Foundation

// N + (N - 1) + dp(N - 3)
// N + dp(N - 2)
func dp() -> Int {
    var dpValue = Array(repeating: 0, count: N + 1)
    dpValue[1] = stairs[1]
    if N == 1 { return dpValue[1] }
    dpValue[2] = stairs[1] + stairs[2]
    
    // Swift는 왼쪽값이 오른쪽값보다 작아지면 오류를 발생시키기 때문에 3보다 커야지 수행될 수 있도록 if 문을 추가해줘야함
    if N > 2 {
        for i in 3...N {
            // 현재위치를 밟지않는 경우는 고려하면 안됨
            dpValue[i] = max(stairs[i] + stairs[i - 1] + dpValue[i - 3], stairs[i] + dpValue[i - 2])
        }
    }
    
    return dpValue[N]
}

let N = Int(readLine()!)!

var stairs = [0]
for _ in 0..<N {
    let height = Int(readLine()!)!
    
    stairs.append(height)
}

let result = dp()

print(result)
