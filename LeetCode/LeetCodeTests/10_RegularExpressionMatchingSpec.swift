//
//  RegularExpressionMatchingSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/26.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class RegularExpressionMatching {

    // Seems to work, but performance is really bad. :(
//    func isMatch(s: String, _ p: String) -> Bool {
//
//        var matches = [""]
//
//        let nodes = p.toReNodes()
//        for node in nodes {
//
//            let n = matches.count
//            if n == 0 {
//                return false
//            }
//
//            for var i = n - 1; i >= 0; i-- {
//                var ms = matches[i]
//                if !node.optional {
//                    matches.removeAtIndex(i)
//                }
//                for var j = ms.characters.count; j < s.characters.count; j++ {
//                    let c = s[j]
//                    if !node.isMatch(c) {
//                        break;
//                    }
//
//                    ms = "\(ms)\(c)"
//                    matches.append(ms)
//
//                    if !node.optional {
//                        break;
//                    }
//                }
//            }
//        }
//        for ms in matches {
//            if ms.characters.count == s.characters.count {
//                return true
//            }
//        }
//        return false
//    }

    // Inspired by http://xiaohuiliucuriosity.blogspot.com/2014/12/regular-expression-matching.html
    func isMatch(s: String, _ p: String) -> Bool {

        let m = s.characters.count
        let n = p.characters.count

        var b = Array(count: m + 1, repeatedValue: Array(count: n + 1, repeatedValue: false))
        b[0][0] = true

        for var i = 0; i < m; i++ {
            b[i + 1][0] = false
        }
        for var j = 0; j < n; j++ {
            b[0][j + 1] = j > 0 && p[j] == "*" && b[0][j - 1]
        }

        for var i = 0; i < m; i++ {
            for var j = 0; j < n; j++ {
                if p[j] != "*" {
                    b[i + 1][j + 1] = b[i][j] && (p[j] == "." || p[j] == s[i])
                } else {
                    b[i + 1][j + 1] = b[i + 1][j - 1] && j > 0 || b[i + 1][j] ||
                        b[i][j + 1] && j > 0 && (p[j - 1] == "." || p[j - 1] == s[i])
                }
            }
        }

        return b[m][n]
    }
}

//private struct ReNode {
//
//    let value: Character!
//    let optional: Bool!
//
//    func isMatch(c: Character) -> Bool {
//
//        if value == "." {
//            return true
//        }
//        return value == c
//    }
//}
//
//private extension String {
//
//    func toReNodes() -> [ReNode] {
//
//        var nodes = [ReNode]()
//        for var i = 0, len = self.characters.count; i < len; {
//            let c = self[i++]
//            var o = false
//            if i < len && self[i] == "*" {
//                i++
//                o = true
//            }
//            nodes.append(ReNode(value: c, optional: o))
//        }
//
//        return nodes
//    }
//}

class RegularExpressionMatchingSpec: QuickSpec {

    override func spec() {

        describe("Regular Expression Matching") {

            var s: RegularExpressionMatching!

            beforeEach {
                s = RegularExpressionMatching()
            }

            it("Case 1") {
                expect(s.isMatch("aa", "a")).to(equal(false))
            }

            it("Case 2") {
                expect(s.isMatch("aa", "aa")).to(equal(true))
            }

            it("Case 3") {
                expect(s.isMatch("aaa", "aa")).to(equal(false))
            }

            it("Case 4") {
                expect(s.isMatch("aa", "a*")).to(equal(true))
            }

            it("Case 5") {
                expect(s.isMatch("aa", ".*")).to(equal(true))
            }

            it("Case 6") {
                expect(s.isMatch("ab", ".*")).to(equal(true))
            }

            it("Case 7") {
                expect(s.isMatch("aab", "c*a*b")).to(equal(true))
            }

            it("Many *") {
                expect(s.isMatch("aaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*a*a*b")).to(equal(true))
            }
        }
    }
}
