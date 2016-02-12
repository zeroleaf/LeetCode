//
//  RomanToIntegerSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/2/12.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class RomanToInteger {

    let map: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]

    func romanToInt(s: String) -> Int {
        let len = s.characters.count
        var sum = 0
        for var i = 0; i < len; i++ {
            if i + 1 < len && map[s[i + 1]] > map[s[i]] {
                sum -= map[s[i]]!
            } else {
                sum += map[s[i]]!
            }
        }
        return sum
    }
}

class RomanToIntegerSpec: QuickSpec {

    override func spec() {

        describe("Roman To Integer") {

            var s: RomanToInteger!

            beforeEach {
                s = RomanToInteger()
            }

            it("Test Case") {
                expect(s.romanToInt("MCD")).to(equal(1400))
                expect(s.romanToInt("MCDXXXVII")).to(equal(1437))
                expect(s.romanToInt("MMMCCCXXXIII")).to(equal(3333))
            }
        }
    }
}
