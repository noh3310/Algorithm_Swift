//
//  9019.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/12/05.
//

import Foundation

// N을 두배로 바꿔줌, 근데 mod 10000연산 해줌
func D(_ number: Int) -> Int {
    // 두배 곱해준 값 mod 10000
    return (number * 2) % 10000
}

// 1을 빼줌, 0이면 9999 넣어줌
func S(_ number: Int) -> Int {
    return (number == 0) ? 9999 : number - 1
}

// 왼쪽으로 한바퀴 이동
func L(_ number: Int) -> Int {
    // 첫번째 값
    let first = number / 1000
    
    return (number % 1000) * 10 + first
}

// 오른쪽으로 한바퀴 이동
func R(_ number: Int) -> Int {
    // 마지막 값
    let last = number % 10
    
    return (number / 10) + (last * 1000)
}

// 테스트케이스 반복
let T = Int(readLine()!)!
for _ in 0..<T {
    let numbers = readLine()!.split(separator: " ")
    let start = Int(numbers[0])!
    let target = Int(numbers[1])!
    
    var visit = Array(repeating: false, count: 10001)
    visit[start] = true

    var queue = [(Int, String)]()
    queue.append((start, ""))
    var index = 0
    
    while !queue.isEmpty {
        let (number, str) = queue[index]
        index += 1
        
        // 목적지 도달했다면 리턴
        if number == target {
            print(str)
            break
        }
        
        // 목적지 도달하지 않았다면 큐에 넣어줌
        let d = D(number)
        if !visit[d] {
            visit[d] = true
            queue.append((D(number), str + "D"))
        }
        
        let s = S(number)
        if !visit[s] {
            visit[s] = true
            queue.append((S(number), str + "S"))
        }
        
        let l = L(number)
        if !visit[l] {
            visit[l] = true
            queue.append((L(number), str + "L"))
        }
        
        let r = R(number)
        if !visit[r] {
            visit[r] = true
            queue.append((R(number), str + "R"))
        }
        
    }
}
