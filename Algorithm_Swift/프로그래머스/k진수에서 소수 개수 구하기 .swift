//
//  k진수에서 소수 개수 구하기 .swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/15.
//

import Foundation

func isPrime(_ number: Int) -> Bool {
    let sqrtValue = Int(sqrt(Double(number)))
    if sqrtValue < 2 {
        return true
    }
    
    // 제곱근까지 소수판별 해야함
    for i in 2...sqrtValue {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    var array = [Int]()
    var number = n
    
    while number != 0 {
        array.append(number % k)
        number /= k
    }
    
    let kNumber = array.reversed().map{String($0)}.reduce("", +)
    let primeCandidate: [Int] = kNumber.split(separator: "0").filter{ $0 != "1" }.map { Int($0)! }
    
    var result = 0
    primeCandidate.forEach {
        if isPrime($0) {
            result += 1
        }
    }
    
    return result
}

let n = 437674
let k = 3
// 3

//let n = 110011
//let k = 10
//// 2

let result = solution(n, k)

print(result)
