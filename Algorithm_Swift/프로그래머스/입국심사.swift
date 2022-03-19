//
//  입국심사.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/19.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var result: Int64 = 0
    let sTimes = times.sorted()
    
    var start = 1
    // 최악으로 걸리는 시간
    var end = sTimes[sTimes.endIndex - 1] * n
    var mid = 0
    
    while start <= end {
        mid = (start + end) / 2
        
        // mid값으로 몇명까지 처리할 수 있는지 확인
        var count = 0
        sTimes.forEach {
            count += mid / $0
        }
        
        if count < n {  // mid에서 n명보다 적게 처리한다면
            start = mid + 1
        } else {    // mid에서 n명 이상 처리할 수 있다면
            if mid <= end {
                result = Int64(mid)
            }
            end = mid - 1
        }
    }
    
    return result
}

let n = 6
let times = [7, 10]
// 28

let result = solution(n, times)

print(result)
