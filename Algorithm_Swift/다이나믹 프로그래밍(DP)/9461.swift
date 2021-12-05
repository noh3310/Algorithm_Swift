//
//  9461.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/12/05.
//

import Foundation

// DP로 미리 값 구해놓기
var dp = [0, 1, 1, 1, 2, 2]
for i in 5..<100 {
    let appendValue = dp[i] + dp[i - 4]
    dp.append(appendValue)
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let number = Int(readLine()!)!
    
    print(dp[number])
}
