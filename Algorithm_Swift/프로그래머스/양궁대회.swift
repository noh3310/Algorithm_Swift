//
//  양궁대회.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/14.
//

import Foundation

func checkScore(_ array: [Int]) -> [Int] {
    var apeachScore = 0
    var myScore = 0
    for i in array.indices {
        // 어피치가 점수가 같거나 큰 경우
        // 둘다 0점이아닌 경우
        if apeach[i] != 0 && array[i] != 0 {
            if apeach[i] >= array[i] {   // 어피치가 같거나 큰 경우
                apeachScore += 10 - i
            } else if apeach[i] < array[i] {    // 내가 점수가 큰 경우
                myScore += 10 - i
            }
        }
            
    }
    return [apeachScore, myScore]
}

func dfs(_ position: Int, _ array: [Int], _ n: Int) {
    // 0점 이하는 쏠 수 없다.
    if position > 10 {
        return
    }
    
    // 화살을 전부다 쐈을 때 이겼는지 점수계산
    if n == 0 {
        print(array)
        let score = checkScore(array)
        if (score[1] - score[0] >= difference || difference == -1) && score[1] > score[0] {
            if resultArray == [-1] {
                resultArray = array
                difference = score[1] - score[0]
            } else {
                var check = false
                // 점수가 낮은 화살을 누가 더 많이 쐈는지 검사
                for i in stride(from: 10, to: -1, by: -1) {
                    if resultArray[i] < array[i] {
                        check = true
                        break
                    }
                }

                if check {
                    resultArray = array
                    difference = score[1] - score[0]
                }
            }
        }
        return
    }
    
    // 다음 과녁으로 넘어가는 것
    for i in 0...n {
        // 쏠 화살 개수가 남아있다면 && 어피치보다 1점 많을떄까지만 화살 쏨
        if n - i >= 0/* && apeach[position] + 1 >= i*/ {
            var temp = array
            temp[position] = i
            dfs(position + 1, temp, n - i)
        }
    }
}

var apeach = [Int]()
var resultArray = [-1]
var difference = -1
func solution(_ n:Int, _ info:[Int]) -> [Int] {
    apeach = info
    
    let array = Array(repeating: 0, count: 11)
    dfs(0, array, n)
    
    return resultArray
}

//let n = 5
//let info = [2,1,1,1,0,0,0,0,0,0,0]
//// [0,2,2,0,1,0,0,0,0,0,0]

//let n = 1
//let info = [1,0,0,0,0,0,0,0,0,0,0]
//// [-1]

//let n = 9
//let info = [0,0,1,2,0,1,1,1,1,1,1]
//// [1,1,2,0,1,2,2,0,0,0,0]

let n = 10
let info = [0,0,0,0,0,0,0,0,3,4,3]
// [1,1,1,1,1,1,1,1,0,0,2]

let result = solution(n, info)

print(result)
