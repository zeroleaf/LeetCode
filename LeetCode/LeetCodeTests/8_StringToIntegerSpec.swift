//
//  StringToIntegerSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/25.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class StringToInteger {

    func myAtoi(str: String) -> Int {

        let s = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())

        let Number: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let MAX = 2147483647
        let MIN = -2147483648

        if s.characters.count == 0 {
            return 0
        }

        var num = 0
        var i = 0
        var flag = 1

        if s[0] == "+" {
            i = 1
        }
        if s[0] == "-" {
            i = 1
            flag = -1
        }

        while i < s.characters.count {
            let c = s[i]
            if !Number.contains(c) {
                break;
            }

            let nextVal = num &* 10 &+ Int(String(c))! * flag
            if (nextVal - Int(String(c))! * flag) / 10 != num {
                if flag > 0 {
                    return MAX
                } else {
                    return MIN
                }
            }
            num = nextVal
            if (num > MAX) {
                return MAX
            }
            if (num < MIN) {
                return MIN
            }
            i++
        }

        return num;
    }

}

class StringToIntegerSpec: QuickSpec {

    override func spec() {

        describe("String to integer") {

            var s: StringToInteger!

            beforeEach {
                s = StringToInteger()
            }

            it("With space") {
                expect(s.myAtoi("   -101   ")).to(equal(-101))
            }

            it("Invalid input") {
                expect(s.myAtoi("lfajoo10021")).to(equal(0))
            }

            it("With Plus") {
                expect(s.myAtoi("+123")).to(equal(123))
            }

            it("Positive value") {
                expect(s.myAtoi("124")).to(equal(124))
            }

            it("Positive Overflow") {
                expect(s.myAtoi("2147483649")).to(equal(2147483647))
            }

            it("Zero") {
                expect(s.myAtoi("0")).to(equal(0))
            }

            it("Negetive value") {
                expect(s.myAtoi("-0123")).to(equal(-123))
            }

            it("Negetive overflow") {
                expect(s.myAtoi("-2147483649")).to(equal(-2147483648))
            }
         }
    }
}
