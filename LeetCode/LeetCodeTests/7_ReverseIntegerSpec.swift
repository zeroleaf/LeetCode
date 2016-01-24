//
//  ReverseIntegerSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/24.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class ReverseInteger {

    func reverse(x: Int) -> Int {

        var result = 0
        var val = x

        while val != 0 {
            let tail = val % 10
            let newResult = result &* 10 &+ tail
            if (newResult - tail) / 10 != result {
                return 0
            }

            result = newResult
            val /= 10
        }

        return result
    }
}

class ReverseIntegerSpec: QuickSpec {

    override func spec() {

        describe("Reverse Integer") {

            var s: ReverseInteger!

            beforeEach {
                s = ReverseInteger()
            }

            it("Zero") {
                expect(s.reverse(0)).to(equal(0))
            }

            it("One") {
                expect(s.reverse(1)).to(equal(1))
            }

            it("Positive Value") {
                expect(s.reverse(123)).to(equal(321))
            }

            it("Positive value 2") {
                expect(s.reverse(1534236469)).to(equal(9646324351))
            }

            it("Positive With Zero ending") {
                expect(s.reverse(10100)).to(equal(101))
            }

            it("Positive Max") {
                expect(s.reverse(Int.max)).to(equal(7085774586302733229))
            }

            it("Positive overflow") {
                expect(s.reverse(7085774586302733299)).to(equal(0))
            }

            it("Negetive Value") {
                expect(s.reverse(-123)).to(equal(-321))
            }

            it("Negetive with zero ending") {
                expect(s.reverse(-10100)).to(equal(-101))
            }

            it("Negetive Min") {
                expect(s.reverse(Int.min)).to(equal(-8085774586302733229))
            }

            it("Expect value is Min max") {
                expect(s.reverse(-8085774586302733229)).to(equal(Int.min))
            }

            it("Negetive overflow") {
                expect(s.reverse(-8085774586302733299)).to(equal(0))
            }
        }
    }
}
