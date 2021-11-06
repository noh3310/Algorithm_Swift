//
//  11866.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/06.
//

import Foundation

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

let N = numbers[0]
let K = numbers[1]

var list = [Int]()
// 배열값 초기화
list.append(contentsOf: stride(from: 1, through: N, by: 1))


var result = [Int]()
var currentPoint = 0
while list.count > 0 {
    // K 만큼 움직여줌
    currentPoint += K - 1
    currentPoint %= list.count
    
    // 현재위치 append
    result.append(list[currentPoint])
    
    // 지워줌
    list.remove(at: currentPoint)
    
    // 시작점을 하나 감소시켜줌, 위치가 끝점이라면 0으로 변경
    currentPoint = currentPoint > list.count - 1 ? 0 : currentPoint
}

print("<", terminator: "")
for index in result.indices {
    print(result[index], terminator: "")
    
    if index < result.count - 1 {
        print(", ", terminator: "")
    }
}
print(">")
