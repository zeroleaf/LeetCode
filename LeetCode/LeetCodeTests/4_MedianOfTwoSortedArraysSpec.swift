//
//  MedianOfTwoSortedArraysSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/21.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class MedianOfTwoSortedArrays {

    // Put into one sorted array then we can easily find the median of the array.
//    func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
//
//        var nums = [Int](count: nums1.count + nums2.count, repeatedValue: 0)
//        var i = 0, i1 = 0, i2 = 0;
//
//        while i1 < nums1.count && i2 < nums2.count {
//            if nums1[i1] < nums2[i2] {
//                nums[i++] = nums1[i1++]
//            } else {
//                nums[i++] = nums2[i2++]
//            }
//        }
//        while i1 < nums1.count {
//            nums[i++] = nums1[i1++]
//        }
//        while i2 < nums2.count {
//            nums[i++] = nums2[i2++]
//        }
//
//        if nums.count % 2 == 0 {
//            return Double((nums[nums.count / 2] + nums[nums.count / 2 - 1])) / 2.0
//        }
//        return Double(nums[nums.count / 2])
//    }

    // Inspired by https://leetcode.com/discuss/15790/share-my-o-log-min-m-n-solution-with-explanation.
    func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {

        // Make sure nums in A is <= B
        let (A, B) = nums1.count > nums2.count ? (nums2, nums1) : (nums1, nums2)
        let (m, n) = (A.count, B.count)

        var (imin, imax) = (0, m)
        let half_len = (m + n + 1) / 2

        while imin <= imax {
            let i = (imin + imax) / 2
            let j = half_len - i

            // j > 0 && i < m is the edge value for B[j - 1] > A[i], otherwise index will out of the array bound
            if j > 0 && i < m && B[j - 1] > A[i] {
                imin = i + 1
            }
            else if i > 0 && j < n && A[i - 1] > B[j] {
                imax = i - 1
            }
            else {
                var num1 = 0, num2 = 0
                if i == 0 {
                    num1 = B[j - 1]
                }
                else if j == 0 {
                    num1 = A[i - 1]
                }
                else {
                    num1 = max(A[i - 1], B[j - 1])
                }

                if (m + n) % 2 == 1 {
                    return Double(num1)
                }

                if i == m {
                    num2 = B[j]
                }
                else if (j == n) {
                    num2 = A[i]
                }
                else {
                    num2 = min(A[i], B[j])
                }
                
                return Double(num1 + num2) / 2.0
            }
        }
        
        return 0.0
    }
}

class MedianOfTwoSortedArraysSpec: QuickSpec {

    override func spec() {

        describe("Find Median Sorted Arrays") {

            var solution: MedianOfTwoSortedArrays!

            beforeEach {
                solution = MedianOfTwoSortedArrays()
            }

            // This should not be the case.
//            it("Not nums.") {
//                expect(solution.findMedianSortedArrays([], [])).to(equal(0.0))
//            }

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
