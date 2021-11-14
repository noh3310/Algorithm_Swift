//
//  1764.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/13.
//

import Foundation

let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }

let N = numbers[0]
let M = numbers[1]

var nList = Set<String>()
var mList = Set<String>()

for _ in 0..<N {
    nList.insert(readLine()!)
}

for _ in 0..<M {
    mList.insert(readLine()!)
}

var result = nList.intersection(mList).sorted()

print(result.count)
for result in result {
    print(result)
}

