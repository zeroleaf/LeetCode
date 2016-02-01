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
//    func longestPalindrome(s: String) -> String {
//
//        var rm = (0, 0)
//        for (var i = 0; i < s.characters.count; i++) {
//            let ri = longestPalindromeWithCenterIndex(i, s: s)
//            if ri.1 - ri.0 > rm.1 - rm.0 {
//                rm = ri
//            }
//        }
//
//        return s.substringWithRange(
//            Range(start: s.startIndex.advancedBy(rm.0), end: s.startIndex.advancedBy(rm.1)))
//    }
//
//    private func longestPalindromeWithCenterIndex(i: Int, s: String) -> (Int, Int) {
//        var l1 = i - 1, h1 = i + 1
//        while l1 >= 0 && h1 < s.characters.count && s[l1] == s[h1] {
//            l1--;
//            h1++;
//        }
//
//        var l2 = i, h2 = i + 1
//        while l2 >= 0 && h2 < s.characters.count && s[l2] == s[h2] {
//            l2--;
//            h2++;
//        }
//
//        if h1 - l1 > h2 - l2 {
//            return (l1 + 1, h1)
//        }
//        return (l2 + 1, h2)
//    }

    // Improve above, inspired by https://leetcode.com/discuss/32204/simple-c-solution-8ms-13-lines.
//    func longestPalindrome(s: String) -> String {
//
//        if s.isEmpty {
//            return ""
//        }
//        if s.characters.count == 1 {
//            return s
//        }
//
//        var start = 0, maxLen = 1
//        for var i = 0; i < s.characters.count; {
//            if s.characters.count - i <= maxLen / 2 {
//                break;
//            }
//
//            var j = i, k = i;
//            while k < s.characters.count - 1 && s[k + 1] == s[k] {
//                k++
//            }
//            i = k + 1
//
//            while j > 0 && k < s.characters.count - 1 && s[j - 1] == s[k + 1] {
//                j--;
//                k++;
//            }
//            let newLen = k - j + 1
//            if newLen > maxLen {
//                start = j
//                maxLen = newLen
//            }
//        }
//
//        return s.substringWithRange(
//            Range(start: s.startIndex.advancedBy(start), end: s.startIndex.advancedBy(start + maxLen)))
//    }

    // O(n) solution inspired by http://articles.leetcode.com/2011/11/longest-palindromic-substring-part-ii.html.
    func longestPalindrome(s: String) -> String {

        let T = preProcess(s)
        let n = T.characters.count
        var P = [Int](count: n, repeatedValue: 0)
        var C = 0, R = 0

        for var i = 1; i < n - 1; i++ {
            let i_mirror = 2 * C - i


            P[i] = (R > i) ? min(R - i, P[i_mirror]) : 0

            while T[i + 1 + P[i]] == T[i - 1 - P[i]] {
                P[i]++
            }

            if i + P[i] > R {
                C = i
                R = i + P[i]
            }
        }

        var maxLen = 0, centerIndex = 0
        for var i = 1; i < n - 1; i++ {
            if P[i] > maxLen {
                maxLen = P[i]
                centerIndex = i
            }
        }

        let index = (centerIndex - 1 - maxLen) / 2
        return s.substringWithRange(
            Range(start: s.startIndex.advancedBy(index), end: s.startIndex.advancedBy(index + maxLen)))
    }

    // ^ and $ signs are sentinels appended to each end to avoid bounds checking
    private func preProcess(s: String) -> String {
        let n = s.characters.count
        if n == 0 {
            return "^$"
        }
        var ret = "^"
        for var i = 0; i < n; i++ {
            ret += "#\(s[i])"
        }
        ret += "#$"
        return ret
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
