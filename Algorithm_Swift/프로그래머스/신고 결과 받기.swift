//
//  신고 결과 받기.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/12.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var dic = [String:Int]()
    var reportList: [[String]] = Array(repeating: [], count: id_list.count)
    var result = Array(repeating: 0, count: id_list.count)
    
    // dic 초기화
    for i in id_list.indices {
        dic.updateValue(i, forKey: id_list[i])
    }
    
    // report 중복 제거
    let set = Set(report)
    let array = Array(set)
    array.forEach {
        let data = $0.split(separator: " ").map{ String($0) }
        let from = data[0]
        let to = data[1]
        reportList[dic[to]!].append(from)
    }
    
    // 결과값에 추가
    reportList.forEach {
        if $0.count >= k {
            $0.forEach {
                result[dic[$0]!] += 1
            }
        }
    }
    
    return result
}

//let id_list = ["muzi", "frodo", "apeach", "neo"]
//let report = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
//let k = 2

let id_list = ["con", "ryan"]
let report = ["ryan con", "ryan con", "ryan con", "ryan con"]
let k = 3

let result = solution(id_list, report, k)

print(result)
