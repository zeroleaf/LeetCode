//
//  MedianOfTwoSortedArraysSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/21.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import UIKit

import Quick
import Nimble

class MedianOfTwoSortedArrays {

    // Put into one sorted array then we can easily find the median of the array.
    func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {

        var nums = [Int](count: nums1.count + nums2.count, repeatedValue: 0)
        if nums.count == 0 {
            return 0.0;
        }

        var i = 0, i1 = 0, i2 = 0;

        while i1 < nums1.count && i2 < nums2.count {
            if nums1[i1] < nums2[i2] {
                nums[i++] = nums1[i1++]
            } else {
                nums[i++] = nums2[i2++]
            }
        }
        while i1 < nums1.count {
            nums[i++] = nums1[i1++]
        }
        while i2 < nums2.count {
            nums[i++] = nums2[i2++]
        }

        if nums.count % 2 == 0 {
            return Double((nums[nums.count / 2] + nums[nums.count / 2 - 1])) / 2.0
        }
        return Double(nums[nums.count / 2])
    }
}

class MedianOfTwoSortedArraysSpec: QuickSpec {

    override func spec() {

        describe("Find Median Sorted Arrays") {

            var solution: MedianOfTwoSortedArrays!

            beforeEach {
                solution = MedianOfTwoSortedArrays()
            }

            it("Not nums.") {
                expect(solution.findMedianSortedArrays([], [])).to(equal(0.0))
            }

            it("Only 1 num in nums1") {
                expect(solution.findMedianSortedArrays([1], [])).to(equal(1.0))
            }

            it("Only 1 num in nums2") {
                expect(solution.findMedianSortedArrays([], [2])).to(equal(2.0))
            }

            it("Two nums in num1") {
                expect(solution.findMedianSortedArrays([1, 2], [])).to(equal(1.5))
            }

            it("Two nums in num1 and num2") {
                expect(solution.findMedianSortedArrays([1], [2])).to(equal(1.5))
            }

            it("Nums1 all less than nums2") {
                expect(solution.findMedianSortedArrays([1, 2, 3], [4])).to(equal(2.5))
            }
        }
    }
}
