//
//  5525.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2021/11/21.
//

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
let IOI = Array(readLine()!)

var check = false
var result = 0
var zeroCount = 0
var i = 1
while i < IOI.count - 1 {
    
    if check == false {
        if IOI[i - 1] == "I" && IOI[i] == "O" && IOI[i + 1] == "I" {
            check.toggle()
            zeroCount = 1
            i += 1
        }
    }
    else {
        if IOI[i] == "O" && IOI[i + 1] == "I" {
            zeroCount += 1
            i += 1
        } else {
            if N <= zeroCount {
                result += zeroCount - N + 1
                i -= 1
            }
            check.toggle()
            zeroCount = 0
        }
    }
    i += 1
}

if check {
    if N <= zeroCount {
        result += zeroCount - N + 1
    }
}

print(result)
