//
//  ListNode.swift
//  Two-Numbers
//
//  Created by Douglas Amorim on 11/09/23.
//

import Foundation

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
    // THIS SOLUTION HAS A PROBLEM WITH UINT64 SIZE
    // possible solution create 2 arrays of int
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
         if var l1ActualNode = l1, var l2ActualNode = l2 {
             var l1NumberS: String = ""
             var l2NumberS: String = ""

             if l1ActualNode.next == nil {
                l1NumberS = String(l1ActualNode.val)
             } else {
                 while l1ActualNode.next != nil {
                     l1NumberS = String(l1ActualNode.val) + l1NumberS
                     l1ActualNode = l1ActualNode.next!
                 }
                 
                 l1NumberS = String(l1ActualNode.val) + l1NumberS
             }


             if l2ActualNode.next == nil {
                 l2NumberS = String(l2ActualNode.val)
             } else {
                 while l2ActualNode.next != nil {
                     l2NumberS = String(l2ActualNode.val) + l2NumberS
                     l2ActualNode = l2ActualNode.next!
                 }
                 
                 l2NumberS = String(l2ActualNode.val) + l2NumberS
             }

             let sum = (Int(l2NumberS) ?? 0) + (Int(l1NumberS) ?? 0)

             var listNode: ListNode? = nil
             for value in String(sum) {
                 let aux: ListNode = ListNode(Int(String(value)) ?? 0, listNode)
                 listNode = aux
             }

             return listNode
         }

         return nil
     }
}
