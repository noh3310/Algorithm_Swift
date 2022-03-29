//
//  7562.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/29.
//

import Foundation

/*
3
8
0 0
7 0
100
0 0
30 50
10
1 1
1 1
 */

let move = [[-2, -1], [-1, -2], [1, 2], [2, 1], [-2, 1], [-1, 2], [1, -2], [2, -1]]

func bfs(_ size: Int, _ start: [Int], _ end: [Int]) -> Int {
    var map = Array(repeating: Array(repeating: Int.max, count: size), count: size)
    var queue = [(Int, Int, Int)]() // x, y, count
    var index = 0
    
    queue.append((start[0], start[1], 0))
    while index < queue.count {
        let (x, y, count) = queue[index]
        index += 1
        
        if x == end[0] && y == end[1] {
            return count
        }
        
        if map[x][y] <= count {
           continue
        }
        
        map[x][y] = count
        
        move.forEach {
            let nx = x + $0[0]
            let ny = y + $0[1]
            
            if nx >= 0 && nx < size && ny >= 0 && ny < size {
                queue.append((nx, ny, count + 1))
            }
        }
    }
    
    return 0
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let size = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    let end = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    
    let result = bfs(size, start, end)
    print(result)
}
