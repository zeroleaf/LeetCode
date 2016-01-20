//
//  LongestSubstringWithoutRepeatingCharactersTest.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/20.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick

class LongestSubstringWithoutRepeatingCharacters {

    // Inspired by https://leetcode.com/discuss/6168/my-o-n-solution
    func lengthOfLongestSubstring(s: String) -> Int {

        if s.characters.count < 2 {
            return s.characters.count
        }

        var maxLen = 1, d = 0
        var map = [Character: Int]()

        for (i, c) in s.characters.enumerate() {
            if map[c] == nil || map[c] < i - d {
                d++
            } else {
                d = i - map[c]!
            }
            map[c] = i

            if d > maxLen {
                maxLen = d
            }
        }

        return maxLen
    }
}

class LongestSubstringWithoutRepeatingCharactersTest: XCTestCase {
    
    func testLengthOfLongestSubstring() {
        let solution = LongestSubstringWithoutRepeatingCharacters()

        let case1 = "abcabcbb"
        XCTAssert(solution.lengthOfLongestSubstring(case1) == 3)

        let case2 = "bbbbb"
        XCTAssert(solution.lengthOfLongestSubstring(case2) == 1)
    }
}
