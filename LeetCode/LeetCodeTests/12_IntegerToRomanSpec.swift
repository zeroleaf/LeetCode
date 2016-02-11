//
//  IntegerToRomanSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/2/11.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class IntegerToRoman {

    let romanPositionGroup: [[Character]] = [["I", "V", "X"], ["X", "L", "C"], ["C", "D", "M"], ["M"]]

    func intToRoman(num: Int) -> String {
        var roman = ""
        var val = num, i = 0
        while val != 0 {
            let m = val % 10
            roman = groupVal(m, group: i) + roman
            i++
            val /= 10
        }
        return roman
    }

    func groupVal(m: Int, group: Int) -> String {
        let g = romanPositionGroup[group]
        switch m {
        case 1...3:
            return String(count: m, repeatedValue: g[0])
        case 4:
            return "\(g[0])\(g[1])"
        case 5:
            return "\(g[1])"
        case 6...8:
            return "\(g[1])" + String(count: m - 5, repeatedValue: g[0])
        case 9:
            return "\(g[0])\(g[2])"
        case 10:
            return "\(g[2])"
        default:
            return ""
        }
    }
}

class IntegerToRomanSpec: QuickSpec {

    override func spec() {

        describe("Integer to Roman") {

            var s: IntegerToRoman!

            beforeEach {
                s = IntegerToRoman()
            }

            it("Case 1") {
                expect(s.intToRoman(1400)).to(equal("MCD"))
                expect(s.intToRoman(1437)).to(equal("MCDXXXVII"))
                expect(s.intToRoman(3333)).to(equal("MMMCCCXXXIII"))
            }
        }
    }
}
