//
//  9375.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/12/05.
//

import Foundation

// 테스트케이스 반복
let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)!
    var clothes = [String:Int]()

    // N번 반복
    for _ in 0..<N {
        let strings = readLine()!.split(separator: " ").compactMap { String($0) }
        let name = strings[0]
        let category = strings[1]
        
        // 값이 있는지 if 문으로 처리
        if clothes[category] != nil {
            // 값이 있다면 1 더해줌
            clothes[category]! += 1
        } else {
            // 값이 없다면 dictonary에 추가해줌
            clothes.updateValue(1, forKey: category)
        }
    }
    
    var result = 1
    // 계산하기
    for (i, iValue) in clothes {
        result += result * iValue
    }
    
    print(result - 1)
}
