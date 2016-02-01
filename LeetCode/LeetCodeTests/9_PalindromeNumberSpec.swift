//
//  PalindromeNumberSpec.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/26.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import XCTest

import Quick
import Nimble

class PalindromeNumber {

    func isPalindrome(x: Int) -> Bool {

        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }

        var i = 0, j = x
        while i < j {
            i = i * 10 + (j % 10)
            j /= 10
        }

        return i == j || i / 10 == j
    }
}

class PalindromeNumberSpec: QuickSpec {

    override func spec() {

        describe("Palindrome Number") {

            var s: PalindromeNumber!

            beforeEach {
                s = PalindromeNumber()
            }

            it("Negetive value") {
                expect(s.isPalindrome(-10)).to(equal(false))
            }

            it("Zero") {
                expect(s.isPalindrome(0)).to(equal(true))
            }

            it("One digit") {
                expect(s.isPalindrome(7)).to(equal(true))
            }

            it("Times of ten") {
                expect(s.isPalindrome(20)).to(equal(false))
            }

            it("Odd Palindrome Number") {
                expect(s.isPalindrome(121)).to(equal(true))
            }

            it("Even Palindrome Number") {
                expect(s.isPalindrome(1221)).to(equal(true))
            }
        }
    }
}
