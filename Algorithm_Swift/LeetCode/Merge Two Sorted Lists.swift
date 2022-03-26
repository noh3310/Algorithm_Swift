//
//  Merge Two Sorted Lists.swift
//  Algorithm_Swift
//
//  Created by 노건호 on 2022/03/26.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addList(_ list: ListNode?, _ currentPos: ListNode?, _ addValue: Int) -> (ListNode?, ListNode?) {
        var tempList = list
        var currentPosition = currentPos
        
        if tempList == nil {
            tempList = ListNode(addValue)
            currentPosition = tempList
        } else {
            currentPosition?.next = ListNode(addValue)
            currentPosition = currentPosition?.next
        }
        
        return (tempList, currentPosition)
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var result: ListNode?
        var currentPosition: ListNode? = result
        
        var node1: ListNode? = list1
        var node2: ListNode? = list2

        while node1 != nil && node2 != nil {
            if let val1 = node1?.val, let val2 = node2?.val {
                if val1 < val2 {
                    (result, currentPosition) = addList(result, currentPosition, val1)
                    node1 = node1?.next
                } else {
                    (result, currentPosition) = addList(result, currentPosition, val2)
                    node2 = node2?.next
                }
            }
            
        }
        
        if node1 == nil {
            while node2 != nil {
                if let value = node2?.val {
                    (result, currentPosition) = addList(result, currentPosition, value)
                    node2 = node2?.next
                }
            }
        } else {
            while node1 != nil {
                if let value = node1?.val {
                    (result, currentPosition) = addList(result, currentPosition, value)
                    node1 = node1?.next
                }
            }
        }
        
        return result
    }
}
