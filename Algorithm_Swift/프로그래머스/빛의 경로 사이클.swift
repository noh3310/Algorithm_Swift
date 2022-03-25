//
//  빛의 경로 사이클.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/23.
//

import Foundation

enum GridArrow: String {
    case straignt = "S"
    case left = "L"
    case right = "R"
}

enum Arrow: Int {
    case TOP
    case BOTTOM
    case LEFT
    case RIGHT
}

func dfs(_ arrow: Arrow, _ count: Int) {
    
}

var visit = [[[Bool]]]()
func solution(_ grid:[String]) -> [Int] {
    var gridMap =  [[GridArrow]]()
    
    // gridMap 초기화
    grid.forEach {
        let data = $0.map{ GridArrow(rawValue: String($0))! }
        gridMap.append(data)
    }
    visit = Array(repeating: Array(repeating: [false, false, false, false], count: grid.count), count: grid[0].count)
    print(visit)
    
    return []
}

let grid = ["SL","LR"]
// [16]

//let grid = ["S"]
//// [1,1,1,1]

//let grid = ["R","R"]
//// [4,4]

let result = solution(grid)

print(result)
