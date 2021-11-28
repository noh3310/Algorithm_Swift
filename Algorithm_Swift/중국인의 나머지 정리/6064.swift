//
//  6064.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/28.
//

import Foundation

// 최대공약수
func GCD(_ min: Int, _ max: Int) -> Int {
    let remain = min % max
    if remain == 0 {
        return max
    }
    else {
        return GCD(max, remain)
    }
}

// 최소공배수
func LCM(_ a: Int, _ b:Int) -> Int {
    return a * b / GCD(a,b)
}

func solution(M: Int, N: Int, targetX: Int, targetY: Int) -> Int {
    let lcm = LCM(N, M)
    
    // 원하는 년도를 고정하고,
    var x = 0
    var y = targetY
    
    while true {
        
        // 만약 최소공배수를 넘어가면 리턴
        if y > lcm {
            return -1
        }
        
        //
        if y % M != 0 {
            x = y % M
        } else {
            x = M
        }
        
        //
        if x == targetX {
            return y
        }
        
        y += N
    }
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    
    let M = numbers[0]
    let N = numbers[1]
    let targetX = numbers[2]
    let targetY = numbers[3]
    
    let result = solution(M: M, N: N, targetX: targetX, targetY: targetY)
    
    print(result)
}
