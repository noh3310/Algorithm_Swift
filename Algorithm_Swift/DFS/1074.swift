//
//  1074.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/06.
//

import Foundation

func dfs(N: Int, x: Int, y: Int) {
    // 만약 차수가 0이라면
    if N == 0 {
        result += 1
        
        if x == r && y == c {
            print("여기 result = \(result)")
        }
        
        return
    }
    
    dfs(N: N - 1, x: x, y: y)
    dfs(N: N - 1, x: x, y: y + Int(pow(Double(2),Double(N - 1))))
    dfs(N: N - 1, x: x + Int(pow(Double(2),Double(N - 1))), y: y)
    dfs(N: N - 1, x: x + Int(pow(Double(2),Double(N - 1))), y: y + Int(pow(Double(2),Double(N - 1))))
}

var result = -1

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }

let N = numbers[0]
let r = numbers[1]
let c = numbers[2]

dfs(N: N, x: 0, y: 0)
