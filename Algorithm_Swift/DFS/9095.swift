//
//  9095.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/12/04.
//

import Foundation

func dfs(_ pos: Int) {
    // 만약 목적지를 벗어났다면 그냥 리턴
    if pos > N {
        return
    }
    
    // 만약 목적지를 도착했다면 결과값에 +1 해줌
    if pos == N {
        result += 1
        return
    }
    // 1, 2, 3 순서대로 더해줌
    dfs(pos + 1)
    dfs(pos + 2)
    dfs(pos + 3)
}

let T = Int(readLine()!)!
var N = 0
var result = 0
for _ in 0..<T {
    // result 초기화
    result = 0
    N = Int(readLine()!)!
    
    dfs(0)
    
    print(result)
}
