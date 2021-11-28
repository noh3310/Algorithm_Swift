//
//  7576.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/28.
//

import Foundation

func isAllNotZero(array: [[Int]]) -> Bool {
    for i in 0..<N {
        for j in 0..<M {
            if array[i][j] == 0 {
                return false
            }
        }
    }
    return true
}

func bfs() -> Int {
    var visit = Array(repeating: Array(repeating: false, count: M), count: N)
    
    var result = 0
    var index = 0
    while !queue.isEmpty {
        if queue.count == index {
            break
        }
        
        // 큐에서 하나 빼기
        let (i, j, count) = queue[index]
        index += 1
        
        // 만약 박스에 사과가 없으면 continue
        if box[i][j] == -1 || visit[i][j] == true {
            continue
        }
        
        result = result < count ? count : result
        
        // 만약 토마토가 익지 않았다면 익힘
        if box[i][j] == 0 {
            visit[i][j] = true
        }
        
        // 큐에 넣어줌
        if i - 1 >= 0 && box[i - 1][j] != 1 { queue.append((i - 1, j, count + 1))}
        if i + 1 < N && box[i + 1][j] != 1 { queue.append((i + 1, j, count + 1))}
        if j - 1 >= 0 && box[i][j - 1] != 1 { queue.append((i, j - 1, count + 1))}
        if j + 1 < M && box[i][j + 1] != 1 { queue.append((i, j + 1, count + 1))}
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if box[i][j] == 0 && visit[i][j] == false {
                return -1
            }
        }
    }
    
    return result
}

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
let M = numbers[0]
let N = numbers[1]

var box = [[Int]]()
for _ in 0..<N {
    let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    box.append(numbers)
}

var queue = [(Int, Int, Int)]()

for i in 0..<N {
    for j in 0..<M {
        if box[i][j] == 1 {
            queue.append((i, j, 0))
        }
    }
}

var result = -1
if isAllNotZero(array: box) {
    result = 0
} else {
    result = bfs()
}

print(result)
