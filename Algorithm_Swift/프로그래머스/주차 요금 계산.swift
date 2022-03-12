//
//  주차 요금 계산.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/12.
//

import Foundation

enum RecordType: String {
    case IN
    case OUT
}

struct Record: Comparable {
    let number: String
    let time: Int
    let type: RecordType
    
    init(data: String) {
        let data = data.split(separator: " ").map{ String($0) }
        let time = data[0].split(separator: ":").map { Int($0)! }
        
        self.number = data[1]
        self.time = time[0] * 60 + time[1]
        self.type = RecordType(rawValue: data[2])!
    }
        
    static func < (lhs: Record, rhs: Record) -> Bool {
        return lhs.number < rhs.number ? true : false
    }
}

let maxTime = 23 * 60 + 59

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    // 차량 번호 추출
    var cars = [String]()
    records.forEach {
        let car = $0.split(separator: " ").map{ String($0) }
        if !cars.contains(car[1]) {
            cars.append(car[1])
        }
    }
    cars = cars.sorted()

    var dic = [String:Int]()
    // dic 초기화
    for i in cars.indices {
        dic.updateValue(i, forKey: cars[i])
    }
    
    // 구조체배열로 변환
    var recordList = [Record]()
    records.forEach {
        recordList.append(Record(data: $0))
    }
    let list = recordList.sorted()
    
    // 시간 계산
    var times = Array(repeating: 0, count: cars.count)
    var i = 0
    while i < list.count {

        if i == list.count {
            continue
        }

        // 지금 들어오고, 다음에 나왔는지 확인
        if i < list.count - 1 && list[i].type == .IN && list[i + 1].type == .OUT {
            times[dic[list[i].number]!] += list[i + 1].time - list[i].time
            i += 1
        } else {
            times[dic[list[i].number]!] += maxTime - list[i].time
        }

        i += 1
    }
    
    // 금액 계산
    var result = [Int]()
    times.forEach {
        var money = 0
        var time = $0
        
        if time > 0 {
            money = fees[1]
        }
        // 시간 빼줌
        time -= fees[0]
        
        // 추가금액
        if time > 0 {
            money += (time / fees[2]) * fees[3]
            if time % fees[2] > 0 {
                money += fees[3]
            }
        }
        result.append(money)
    }
    
    return result
}

let fees = [180, 5000, 10, 600]
let records = ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]

//let fees = [120, 0, 60, 591]
//let records = ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]

//let fees = [1, 461, 1, 10]
//let records = ["00:00 1234 IN"]

let result = solution(fees, records)
