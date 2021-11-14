//
//  1780.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/14.
//

import Foundation

func isSameValue(x: Int, y: Int, size: Int) -> Bool {
    let check = papers[x][y]
    for i in x..<x + size {
        for j in y..<y + size {
            if check != papers[i][j] {
                return false
            }
        }
    }
    return true
}

func addPage(number: Int) {
    if number == -1 { minusOne += 1 }
    else if number == 0 { zero += 1 }
    else if number == 1 { one += 1 }
}

func dfs(x: Int, y: Int, size: Int) {
    // size가 1이거나 현재 페이지가 전부다 같은 숫자인 경우 더해줌
    if size == 1 || isSameValue(x: x, y: y, size: size) {
        addPage(number: papers[x][y])
        return
    }
    
    // 현재 페이지가 전부다 같은수가 아니기 때문에 dfs로 타고 들어감
    let divSize = size / 3
    for i in 0..<3 {
        for j in 0..<3 {
            dfs(x: x + (divSize * i), y: y + (divSize * j), size: divSize)
        }
    }
}

let N = Int(readLine()!)!

var papers = [[Int]]()

for _ in 0..<N {
    let value = readLine()!.split(separator: " ").compactMap{ Int(String($0))! }
    papers.append(value)
}

var minusOne = 0
var zero = 0
var one = 0

dfs(x: 0, y: 0, size: N)

print(minusOne)
print(zero)
print(one)
