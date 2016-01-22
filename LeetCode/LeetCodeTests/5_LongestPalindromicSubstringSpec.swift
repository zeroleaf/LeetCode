//
//  LongestPalindromicSubstringSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/22.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class LongestPalindromicSubstring {

    // t = O(n^2), s = O(1), seems to work, but time limit in leetcode.
    func longestPalindrome(s: String) -> String {

        var rm = (0, 0)
        for (var i = 0; i < s.characters.count; i++) {
            let ri = longestPalindromeWithCenterIndex(i, s: s)
            if ri.1 - ri.0 > rm.1 - rm.0 {
                rm = ri
            }
        }

        return s.substringWithRange(
            Range(start: s.startIndex.advancedBy(rm.0), end: s.startIndex.advancedBy(rm.1)))
    }

    private func longestPalindromeWithCenterIndex(i: Int, s: String) -> (Int, Int) {
        var l1 = i - 1, h1 = i + 1
        while l1 >= 0 && h1 < s.characters.count && s[l1] == s[h1] {
            l1--;
            h1++;
        }

        var l2 = i, h2 = i + 1
        while l2 >= 0 && h2 < s.characters.count && s[l2] == s[h2] {
            l2--;
            h2++;
        }

        if h1 - l1 > h2 - l2 {
            return (l1 + 1, h1)
        }
        return (l2 + 1, h2)
    }
}

extension String {

    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
}

class LongestPalindromicSubstringSpec: QuickSpec {

    override func spec() {
        describe("Longest palindromic substring") {

            var solution: LongestPalindromicSubstring!

            beforeEach {
                solution = LongestPalindromicSubstring()
            }

            it("Single character") {
                expect(solution.longestPalindrome("a")).to(equal("a"))
            }

            it("Palindromic is self") {
                expect(solution.longestPalindrome("abcba")).to(equal("abcba"))
            }

            it("All character is the same") {
                expect(solution.longestPalindrome("mmmmmm")).to(equal("mmmmmm"))
            }

            it("Normal") {
                expect(solution.longestPalindrome("abddbmnp")).to(equal("bddb"))
            }

            it("A long string") {
                expect(solution.longestPalindrome("jrjnbctoqgzimtoklkxcknwmhiztomaofwwzjnhrijwkgmwwuazcowskjhitejnvtblqyepxispasrgvgzqlvrmvhxusiqqzzibcyhpnruhrgbzsmlsuacwptmzxuewnjzmwxbdzqyvsjzxiecsnkdibudtvthzlizralpaowsbakzconeuwwpsqynaxqmgngzpovauxsqgypinywwtmekzhhlzaeatbzryreuttgwfqmmpeywtvpssznkwhzuqewuqtfuflttjcxrhwexvtxjihunpywerkktbvlsyomkxuwrqqmbmzjbfytdddnkasmdyukawrzrnhdmaefzltddipcrhuchvdcoegamlfifzistnplqabtazunlelslicrkuuhosoyduhootlwsbtxautewkvnvlbtixkmxhngidxecehslqjpcdrtlqswmyghmwlttjecvbueswsixoxmymcepbmuwtzanmvujmalyghzkvtoxynyusbpzpolaplsgrunpfgdbbtvtkahqmmlbxzcfznvhxsiytlsxmmtqiudyjlnbkzvtbqdsknsrknsykqzucevgmmcoanilsyyklpbxqosoquolvytefhvozwtwcrmbnyijbammlzrgalrymyfpysbqpjwzirsfknnyseiujadovngogvptphuyzkrwgjqwdhtvgxnmxuheofplizpxijfytfabx")).to(equal("qosoq"))
            }
        }
    }

}
