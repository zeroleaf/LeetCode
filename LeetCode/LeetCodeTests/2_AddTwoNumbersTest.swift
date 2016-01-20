//
//  AddTwoNumbersTest.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/19.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Nimble
import Quick

class AddTwoNumbers {

    class ListNode {
        var val: Int
        var next: ListNode?

        init() {
            self.val  = 0
            self.next = nil
        }

        init(val: Int) {
            self.val  = val
            self.next = nil
        }
    }

    // Inspired by https://leetcode.com/discuss/2308/is-this-algorithm-optimal-or-what
    func addTwoNumbers(l1: ListNode?, l2: ListNode?) -> ListNode {

        let dummy = ListNode()
        var n1 = l1
        var n2 = l2
        var d  = dummy

        var sum = 0
        while n1 != nil || n2 != nil {
            sum /= 10
            if n1 != nil {
                sum += n1!.val
                n1 = n1!.next
            }
            if n2 != nil {
                sum += n2!.val
                n2 = n2!.next
            }

            d.next = ListNode(val: sum % 10)
            d = d.next!
        }
        if sum / 10 == 1 {
            d.next = ListNode(val: 1)
        }
        return dummy.next!
    }
}

extension AddTwoNumbers.ListNode {

    func toArray() -> [Int] {
        var array = [Int]()
        var d: AddTwoNumbers.ListNode? = self
        while d != nil {
            array.append(d!.val)
            d = d?.next
        }
        return array
    }
}

class AddTwoNumbersTest: XCTestCase {

    typealias ListNode = AddTwoNumbers.ListNode

    func testAddTwoNumbers() {
        let solution = AddTwoNumbers()

        let l1 = self.listNodeWithArray([2, 4, 3])
        let l2 = self.listNodeWithArray([5, 6, 6])

        let rs = solution.addTwoNumbers(l1, l2: l2)
        XCTAssert(rs.toArray() == [7, 0, 0, 1])
    }

    private func listNodeWithArray(nodeValues: [Int]) -> ListNode? {

        let dummy = ListNode()
        var d = dummy

        for nodeValue in nodeValues {
            d.next = ListNode(val: nodeValue)
            d = d.next!
        }
        return dummy.next
    }
}
