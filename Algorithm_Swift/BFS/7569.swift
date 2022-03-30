//
//  7569.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/28.
//

import Foundation

func isAllNotZero(array: [[[Int]]]) -> Bool {
    for i in 0..<H {
        for j in 0..<N {
            for k in 0..<M {
                if array[i][j][k] == 0 {
                    return false
                }
            }
        }
    }
    return true
}

func bfs() -> Int {
    var visit = Array(repeating: Array(repeating: Array(repeating: false, count: M), count: N), count: H)
    
    var result = 0
    var index = 0
    while index < queue.count {
        let (i, j, k, count) = queue[index]
        index += 1

        // 만약 박스에 사과가 없으면 continue
        if box[i][j][k] == -1 || visit[i][j][k] == true {
            continue
        }

        result = result < count ? count : result

        // 만약 토마토가 익지 않았다면 익힘
        if box[i][j][k] == 0 {
            visit[i][j][k] = true
        }

        // 큐에 넣어줌
        if i - 1 >= 0 && box[i - 1][j][k] != 1 { queue.append((i - 1, j, k, count + 1))}
        if i + 1 < H && box[i + 1][j][k] != 1 { queue.append((i + 1, j, k, count + 1))}
        if j - 1 >= 0 && box[i][j - 1][k] != 1 { queue.append((i, j - 1, k, count + 1))}
        if j + 1 < N && box[i][j + 1][k] != 1 { queue.append((i, j + 1, k, count + 1))}
        if k - 1 >= 0 && box[i][j][k - 1] != 1 { queue.append((i, j, k - 1, count + 1))}
        if k + 1 < M && box[i][j][k + 1] != 1 { queue.append((i, j, k + 1, count + 1))}
    }

    for i in 0..<H {
        for j in 0..<N {
            for k in 0..<M {
                if box[i][j][k] == 0 && visit[i][j][k] == false {
                    return -1
                }
            }
        }
    }

    return result
}

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
let M = numbers[0]
let N = numbers[1]
let H = numbers[2]

var box = [[[Int]]]()
for _ in 0..<H {
    var floorBox = [[Int]]()
    for _ in 0..<N {
        let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
        floorBox.append(numbers)
    }
    box.append(floorBox)
}

var queue = [(Int, Int, Int, Int)]()

for i in 0..<H {
    for j in 0..<N {
        for k in 0..<M {
            if box[i][j][k] == 1 {
                queue.append((i, j, k, 0))
            }
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
