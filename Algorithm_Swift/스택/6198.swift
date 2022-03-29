//
//  6198.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/27.
//

import Foundation

/*
6
10
3
7
4
12
2
 */

let maxHeight = 1000000001

let size = Int(readLine()!)!
var buildings = [Int]()

for _ in 0..<size {
    let value = Int(readLine()!)!
    buildings.append(value)
}
buildings.append(maxHeight)

var stack = [(Int, Int)]()
var top = -1

var result = 0
for i in buildings.indices {
    while top > -1 {
        let (index, value) = stack[top]
        if value <= buildings[i] {
            stack.removeLast()
            top -= 1
            result += i - index - 1
        } else {
            break
        }
    }
    stack.append((i, buildings[i]))
    top += 1
}

print(result)
