//
//  오픈채팅방.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/12.
//

import Foundation

// 시간복잡도 2N
// record배열 2번 순회함
// 역순으로 순회하면 시간복잡도 N만에 가능
func solution(_ record: [String]) -> [String] {
    var result: [String] = []
    var dic: [String: String] = [:]
    
    record.forEach {
        let text = $0.split(separator: " ").map{ String($0) }
        // Enter이랑, Change할 때 닉네임 변경하기
        if text[0] == "Enter" || text[0] == "Change" {
            dic.updateValue(text[2], forKey: text[1])
        }
    }
    
    record.forEach {
        let text = $0.split(separator: " ").map{ String($0) }
        
        if text[0] == "Enter" {
            result.append("\(dic[text[1]]!)님이 들어왔습니다.")
        } else if text[0] == "Leave" {
            result.append("\(dic[text[1]]!)님이 나갔습니다.")
        }
    }
    
    return result
}

let result = solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])

print(result)
