//
//  LongestValidParenthesesSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/2/13.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class LongestValidParentheses {

    // Inspired by https://leetcode.com/discuss/8092/my-dp-o-n-solution-without-using-stack

    // 构造一个 longest 数组, 对任意的 longest[i], 表示在 i 处结束的有效括号匹配的最长长度.
    // 主要的想法如下:
    // * 如果 longest[i] == "(", 则 longest[i] = 0, 因为这种情况下不可能匹配了.
    // * 如果 longest[i] == ")"
    // ** 如果 longest[i - 1] == "(", 那么 i - 1 与 i 能匹配, 因此 longest[i] = longest[i-2] + 2.
    // ** 如果 longest[i - 1] == ")" 并且 s[i-longest[i-1]-1] == "(", 这种情况下 
    //    s[i-longest[i-1]-1] 能与 s[i] 匹配, 因此, longest[i] = longest[i-1] + 2 + longest[i-longest[i-1]-2].
    //
    // 但其实 2.2 覆盖了 2.1 的情况, 因为如果 longest[i - 1] 没有任何匹配, 其值为 0, 
    // longest[i] = longest[i-1] + 2 + longest[i-longest[i-1]-2] = 0 + 2 + longest[i-0-2] = longest[i-2] + 2
    // 如下的算法之所以添加一个前缀是因为开始的 ")" 不会与任何括号元素匹配, 同时避免边界检测.
//    func longestValidParentheses(s: String) -> Int {
//        let input = ")" + s
//        var longest = [Int](count: input.characters.count, repeatedValue: 0)
//
//        for var i = 1; i < input.characters.count; i++ {
//            if input[i] == ")" && input[i - longest[i - 1] - 1] == "(" {
//                longest[i] = longest[i - 1] + 2 + longest[i - longest[i - 1] - 2]
//            }
//        }
//
//        return longest.maxElement()!
//    }

    // Inspired by https://leetcode.com/discuss/7609/my-o-n-solution-using-a-stack

    // st 中保存的是未匹配的括号的索引位置, 因此最后的 while 循环是找出位置为 a 处的有效括号匹配长度
    // 其中的最大值即为最长的有效括号匹配长度.
    func longestValidParentheses(s: String) -> Int {

        let n = s.characters.count

        var st = [Int]()
        for var i = 0; i < n; i++ {
            if s[i] == ")" && !st.isEmpty && s[st.last!] == "(" {
                st.removeLast()
            } else {
                st.append(i)
            }
        }

        if st.isEmpty {
            return n
        }

        var a = n, b = 0, longest = 0
        while !st.isEmpty {
            b = st.removeLast()
            longest = max(longest, a - b - 1)
            a = b
        }
        longest = max(longest, a)
        return longest
    }
}

class LongestValidParenthesesSpec: QuickSpec {

    override func spec() {

        describe("Longest valid parentheses") {

            var s: LongestValidParentheses!

            beforeEach {
                s = LongestValidParentheses()
            }

            it("Case 1") {
                expect(s.longestValidParentheses("(()")).to(equal(2))
            }

            it("Case 2") {
                expect(s.longestValidParentheses(")()())"))
            }

            it("Empty String") {
                expect(s.longestValidParentheses("")).to(equal(0))
            }

            it("A very long input") {
                expect(s.longestValidParentheses("())()()(())((()(()()(((()))((((())((()(())()())(()((((()))()(()))(())()(())(()(((((())((((((()())())(()(()((())()))(()))))))()(()))((((())()()()))()()()(((()(()())(()()(()(()()(((()))))))()()))())())((()()))))))((()))(((()((())()(()()))((())))()()())))))))()))))(()))))()))()))()((())))((()))(()))))))(((()))))))))()(()()()(())((())()))()()(())))()()))(()())()))(((()())()))((())((((()))(()(()(()()()(((())()(((((()))((()(((((())(()()))((((((((()(()(()(()(())))(())(()())())(()((((()(())((()(())))(())))()(((((()(()()(())))))))())(())(())(()()(((())))((()))(((((()))))())))()((()))()))))())))))((())(((((()()))((((())))(((()(()(())())(((()(()(()()()())))())()))((()((())())()()()(((())(((((()((((((()((()())))((((())((()(((((((()(()((()()()(()(()())(()(()()((((())))()(((()())))(()()))()(()()()()(((((())(()))))((()))())))()((((((()))())))()(()))(())))((((()())(((((()()())(((((())(()())(()))))()(()()))()))))))())))(((())(()(()()))(()))()(((())))())((((()(((()))))))()(()(()))()()(()()))))))))((()))))))(())((()((()))()))((((((()())))))(()((())((((()))))(()(()()()()(()))()()(()(()))(()()(((((((()())(())(()())((())())()(()())((())()())())(()())))())))(())())())(())((()())(((()()))()))()()))()(()(())((((((((())))()((())((()((((((((((()))))(()(((((())(()(()())())))((())())))))()))(()((()()))((()((())()()()((()(())())((())())(()()(((())))))())()()(()))()())(()(()((())))((((()()(())))())(())(()(()(())())())(()()())()(())())))(()()(((())))((()()(((())()()(()())((((()()(()())(()((((()(()()(()(()(((()((()())(()()))(()((((()(((((()))))()()))(((()((((((()(()()()()())()))(()(())))))((()(((()())())))(((()()))(()(()(((((((()()))(()(())))())()(())())(())(()))(())(()))()()(()()())))))()))()((())(((()((((((((())()()))())))((()())(")).to(equal(310))
            }
        }
    }
}
