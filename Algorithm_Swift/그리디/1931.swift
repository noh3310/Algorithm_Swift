//
//  1931.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/14.
//

import Foundation

struct Meeting: Comparable {
    static func < (lhs: Meeting, rhs: Meeting) -> Bool {
        if lhs.end < rhs.end { return true }
        else if lhs.end == rhs.end {
            if lhs.start < rhs.start { return true }
            else { return false }
        }
        return false
    }
    
    let start: Int
    let end: Int
}

let N = Int(readLine()!)!

var meetings = [Meeting]()
for _ in 0..<N {
    let meeting = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    
    meetings.append(Meeting(start: meeting[0], end: meeting[1]))
}

meetings = meetings.sorted()

var currentTime = 0
var result = 0
for meeting in meetings {
    // 미팅예약을 할 수 있다면
    if currentTime <= meeting.start {
        currentTime = meeting.end
        result += 1
    }
}

print(result)
