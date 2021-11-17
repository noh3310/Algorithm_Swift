//
//  2606.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/14.
//

import Foundation

func dfs(position: Int) {
    // 이미 방문했다면 리턴
    if computers[position] {
        return
    }
    
    computers[position] = true
    
    for pair in pairList {
        if pair[0] == position { dfs(position: pair[1]) }
        else if pair[1] == position { dfs(position: pair[0])}
    }
}

let computerNumber = Int(readLine()!)!

var computers = Array(repeating: false, count: computerNumber + 1)

let pairNumber = Int(readLine()!)!

var pairList = [[Int]]()
for _ in 0..<pairNumber {
    let pairs = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    
    pairList.append([pairs[0], pairs[1]])
}

dfs(position: 1)

var resultArray = computers.filter { $0 == true }
// 1번 노드는 포함시키지 않으므로 -1 해줌
print(resultArray.count - 1)
 
