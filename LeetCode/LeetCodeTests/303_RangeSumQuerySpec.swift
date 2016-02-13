//
//  RangeSumQuerySpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/2/13.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class RangeSumQuery {

    var sums: [Int]

    init(nums: [Int]) {
        sums = [Int](count: nums.count, repeatedValue: 0)
        if !nums.isEmpty {
            sums[0] = nums[0]
        }
        for var i = 1; i < nums.count; i++ {
            sums[i] = sums[i - 1] + nums[i]
        }
    }

    func sumRange(i: Int, j: Int) -> Int {
        if i == 0 {
            return sums[j]
        }
        return sums[j] - sums[i - 1]
    }
}

class RangeSumQuerySpec: QuickSpec {

    override func spec() {

        describe("Range Sum Query") {

            it("Test Case") {
                let nums = [-2, 0, 3, -5, 2, -1]
                let s = RangeSumQuery(nums: nums)

                expect(s.sumRange(0, j: 2)).to(equal(1))
                expect(s.sumRange(2, j: 5)).to(equal(-1))
                expect(s.sumRange(0, j: 5)).to(equal(-3))
            }
        }
    }
}
