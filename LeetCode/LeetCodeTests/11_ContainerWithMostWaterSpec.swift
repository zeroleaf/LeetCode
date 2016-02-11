//
//  ContainerWithMostWaterSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/2/6.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class ContainerWithMostWater {

//    func maxArea(height: [Int]) -> Int {
//
//        if height.count < 2 {
//            return 0
//        }
//
//        let n = height.count
//
//        var maxArea = 0
//        for var i = 0; i < n - 1; {
//            let h1 = height[i]
//
//            for var j = i + 1; j < n; j++ {
//                let area = min(h1, height[j]) * (j - i)
//                if area > maxArea {
//                    maxArea = area
//                }
//            }
//
//            i++
//            while i < n - 1 && height[i] < h1 {
//                i++
//            }
//        }
//
//        return maxArea
//    }

    // Inspired by https://leetcode.com/discuss/1074/anyone-who-has-a-o-n-algorithm
    // Proof by contradiction.
    func maxArea(height: [Int]) -> Int {

        let len = height.count
        var low = 0, high = len - 1

        var maxArea = 0
        while low < high {
            maxArea = max(maxArea, (high - low) * min(height[low], height[high]))
            if height[low] < height[high] {
                low++
            } else {
                high--
            }
        }
        return maxArea
    }
}

class ContainerWithMostWaterSpec: QuickSpec {

    override func spec() {

        describe("Container With Most Water") {

            var s: ContainerWithMostWater!

            beforeEach {
                s = ContainerWithMostWater()
            }

            it("Case 1") {
                expect(s.maxArea([1, 2, 3, 4, 5])).to(equal(6))
            }

            it("Case 2") {
                expect(s.maxArea([5, 4, 3, 2, 1,])).to(equal(6))
            }
        }
    }

}
