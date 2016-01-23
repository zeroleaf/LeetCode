//
//  ZigZagConversionSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/23.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class ZigZagConversion {

//    func convert(s: String, _ numRows: Int) -> String {
//
//        var rs = [String](count: numRows, repeatedValue: "")
//
//        var flag = -1, row = 0
//        for var i = 0; i < s.characters.count; i++ {
//
//            rs[row] += String(s[i])
//            if i % (numRows - 1) == 0 {
//                flag = -flag
//            }
//
//            row += flag
//        }
//
//        var r = ""
//        for s in rs {
//            r += s
//        }
//
//        return r
//    }

    func convert(s: String, _ numRows: Int) -> String {

        if numRows == 1 {
            return s
        }

        let n = s.characters.count, d = 2 * (numRows - 1)
        var indices = [Int](count: n, repeatedValue: 0)
        var index = 0

        for var row = 0; row < numRows; row++ {
            if row == 0 || row == numRows - 1 {
                for var j = row; j < n; j += d {
                    indices[index++] = j
                }
            } else {
                var r = 2 * row
                for var j = row; j < n; {
                    indices[index++] = j
                    r = d - r
                    j += r
                }
            }
        }

        var cs = [Character](count: n, repeatedValue: "0")
        for (i, si) in indices.enumerate() {
            cs[i] = s[si]
        }

        return String(cs)
    }
}

class ZigZagConversionSpec: QuickSpec {

    override func spec() {

        var solution: ZigZagConversion!

        beforeEach {
            solution = ZigZagConversion()
        }

        describe("Zig Zag Conversion") {

            it("Empty String") {
                expect(solution.convert("", 1)).to(equal(""))
            }

            it("Case 1") {
                let s = "PAYPALISHIRING"
                expect(solution.convert(s, 3)).to(equal("PAHNAPLSIIGYIR"))
            }
        }
    }
}
