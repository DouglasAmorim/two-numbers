//
//  ListNode.swift
//  Two-Numbers
//
//  Created by Douglas Amorim on 11/09/23.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public class ListNode {
     public var val: Int
     public var next: ListNode?
    
     public init() {
         self.val = 0
         self.next = nil
     }
    
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class TwoNumbers {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
         if var l1ActualNode = l1, var l2ActualNode = l2 {
             var l1Array: [Int] = []
             var l2Array: [Int] = []
             
             if l1ActualNode.next == nil {
                 l1Array.append(l1ActualNode.val)
             } else {
                 while l1ActualNode.next != nil {
                     l1Array.append(l1ActualNode.val)
                     l1ActualNode = l1ActualNode.next!
                 }
                 
                 l1Array.append(l1ActualNode.val)
             }
             
             if l2ActualNode.next == nil {
                 l2Array.append(l2ActualNode.val)
             } else {
                 while l2ActualNode.next != nil {
                     l2Array.append(l2ActualNode.val)
                     l2ActualNode = l2ActualNode.next!
                 }
                 
                 l2Array.append(l2ActualNode.val)
             }
             
             let maxCount = max(l1Array.count, l2Array.count)
             var leftoverSum: Int = 0
             var awnserArray:[Int] = []
             
             for i in 0..<maxCount {
                 let n1: Int = l1Array[safe: i] ?? 0
                 let n2: Int = l2Array[safe: i] ?? 0
                 
                 let sum = n1 + n2 + leftoverSum
                 
                 if sum >= 10 {
                     awnserArray.append(sum - 10)
                     leftoverSum = 1
                     
                 } else {
                     awnserArray.append(sum)
                     leftoverSum = 0
                 }
             }

             if leftoverSum != 0 {
                 awnserArray.append(leftoverSum)
             }
             
             var listNode: ListNode? = nil
             for value in awnserArray.reversed() {
                 let aux: ListNode = ListNode(value, listNode)
                 listNode = aux
             }

             return listNode
         }

         return nil
     }
    
    private var leftOver = 0

    func recursiveApproach(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && leftOver == 0 {
            return nil
        }

        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + leftOver
        leftOver = sum / 10

        return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
    }
}
