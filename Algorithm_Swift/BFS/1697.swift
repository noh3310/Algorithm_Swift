//
//  1697.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/13.
//

import Foundation

func bfs(N: Int, K: Int) -> Int {
    var queue = [(Int, Int)]()
    
    // 값 초기화(최대거리보다 멀게 값을 설정)
    var array = Array(repeating: 1000000, count: 100001)
    
    var index = 0
    queue.append((N, 0))
    while !queue.isEmpty {
        let (position, count) = queue[index]
        index += 1
        
        // 만약 목적지에 도달했다면 바로 return
        if position == K {
            return count
        }
        
        // 만약 현재위치에 같거나 같은 값이 온다면 continue 해줌
        if array[position] <= count {
            continue
        }
        
        // 더 짧은 거리기 때문에 업데이트해줌
        array[position] = count
        
        // + 1 enqueue
        if position + 1 < array.count {
            queue.append((position + 1, count + 1))
        }
        
        // - 1 enqueue
        if position - 1 >= 0 {
            queue.append((position - 1, count + 1))
        }
        
        // * 1 enqueue
        if position * 2 < array.count {
            queue.append((position * 2, count + 1))
        }
    }
    
    return array[K]
}

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }

let N = numbers[0]
let K = numbers[1]

let result = bfs(N: N, K: K)

print(result)
