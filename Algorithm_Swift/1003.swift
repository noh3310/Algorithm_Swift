//
//  1003.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/06.
//

import Foundation

// 미리 DP로 구해놓기
var resultList = [[Int]](repeating: Array(repeating: 0,count: 2), count: 41)
resultList[0][0] = 1
resultList[0][1] = 0

resultList[1][0] = 0
resultList[1][1] = 1

for i in 2...40 {
    resultList[i][0] = resultList[i - 1][0] + resultList[i - 2][0]
    resultList[i][1] = resultList[i - 1][1] + resultList[i - 2][1]
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let number = Int(readLine()!)!
    
    print("\(resultList[number][0]) \(resultList[number][1])")
}
