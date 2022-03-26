//
//  1158.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/25.
//

import Foundation

let number = readLine()!.components(separatedBy: " ").map { Int($0)! }
let size = number[1] - 1

var array = Array(1...number[0])

var result = [Int]()
var index = size
while array.count > 0 {
    let removeValue = array.remove(at: index)
    result.append(removeValue)

    if array.count > 0 {
        index = (index + size) % array.count
    }
}

print("<", terminator: "")
for i in result.indices {
    print(result[i], terminator: "")
    if i < result.count - 1 {
        print(", ", terminator: "")
    }
}
print(">")
