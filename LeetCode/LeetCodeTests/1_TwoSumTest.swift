//
//  TwoSumTest.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/17.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

class TwoSum {

    // O(n^2)
//    func twoSum(nums: [Int], _ target: Int) -> [Int] {
//        for i1 in 0..<nums.count {
//            for i2 in (i1 + 1)..<nums.count {
//                if nums[i1] + nums[i2] == target {
//                    return [i1 + 1, i2 + 1]
//                }
//            }
//        }
//        return [Int]()
//    }

    // O(n)
    func twoSum(nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for (index, num) in nums.enumerate() {
            if let match = map[num] {
                return [match + 1, index + 1]
            } else {
                map[target - num] = index
            }
        }
        return [Int]()
    }
}

class TwoSumTest: XCTestCase {

    let case0 = [2, 7, 11, 15]
    let case1 = [3, 2, 4]

    let twoSum = TwoSum()

    func testTwoSum() {
        let result0 = twoSum.twoSum(case0, 9)
        XCTAssert(result0[0] == 1 && result0[1] == 2, "TwoSum")

        let result1 = twoSum.twoSum(case1, 6)
        XCTAssert(result1[0] == 2 && result1[1] == 3, "TwoSum")
    }

}
