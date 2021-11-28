//
//  1717.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/28.
//

import Foundation

func union(_ a: Int, _ b: Int) {
    let A = find(a)
    let B = find(b)
    
    if a > b {
        array[A] = B
    } else {
        array[B] = A
    }
}

func find(_ number: Int) -> Int {
    if array[number] == number {
        return number
    }
    array[number] = find(array[number])
    return array[number]
}

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
let N = numbers[0]
let M = numbers[1]

var array = Array(0...N)

var linkedList: [[Int]] = Array(repeating: Array(repeating: 0, count: 0), count: N + 1)

for _ in 0..<M {
    let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    let check = numbers[0]
    let start = numbers[1]
    let end = numbers[2]

    if check == 0 {
        union(start, end)
    } else {
        if find(start) == find(end) {
            print("YES")
        } else {
            print("NO")
        }
    }
}
