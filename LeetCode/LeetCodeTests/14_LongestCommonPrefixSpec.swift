//
//  LongestCommonPrefixSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/2/12.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class LongestCommonPrefix {

    func longestCommonPrefix(strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        if strs.count == 1 {
            return strs[0]
        }

        var prefix = ""
        let minLen = strs.reduce(Int.max) { (len, str) -> Int in
            return min(len, str.characters.count)
        }
        for var i = 0; i < minLen; i++ {
            let lc = strs[0][i]
            var j = 1;
            for ; j < strs.count; j++ {
                let c = strs[j][i]
                if c != lc {
                    break
                }
            }
            if j != strs.count {
                break
            }
            prefix = "\(prefix)\(lc)"
        }
        return prefix
    }
}

class LongestCommonPrefixSpec: QuickSpec {

    override func spec() {

        describe("Longest Common Prefix") {

            var s: LongestCommonPrefix!

            beforeEach {
                s = LongestCommonPrefix()
            }

            it("Test Case") {
                let strs1 = [
                    "Nice to meet you!",
                    "Nice to see you!",
                    "Nice to go home"
                ]

                expect(s.longestCommonPrefix(strs1)).to(equal("Nice to "))
            }
        }
    }
}
