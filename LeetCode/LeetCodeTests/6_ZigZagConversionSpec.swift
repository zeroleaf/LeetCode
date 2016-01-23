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
        var r = ""

        for var row = 0; row < numRows; row++ {
            var idx = row
            if row == 0 || row == numRows - 1 {
                while idx < n {
                    r += "\(s[idx])"
                    idx += d
                }
            } else {
                var ni = d - 2 * row
                while idx < n {
                    r += "\(s[idx])"
                    idx += ni
                    ni = d - ni
                }
            }
        }

        return r
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

            it("Long strong") {
                let s = "fuxxhzkdlmcpcolhacxyhzqhgetgriewfbwobgrovwfxkqemuencfdlljetapxzubvkcdbsazyxlqeylinppqaacgwextdtuadyghtggrgsjkswufljxnlzwhetdjnzksaqztyimeavouskzfvwthyrqckvnzvzuvpvqodcufxjzrvaxrxsaxjsbvooxlorifmyvsaqxzbzrwzqpykrvvkwsalpnbivgxtcrvuouvnntpfjnpajkmfdosubtfwacretmyjjvzyooezdvcmgouldohgimdkqwqllqxwlyuzmybrudecrapwoydynikfearrqqnboidcietehzgazxzqycqlkbqqbjiuzvvpfarognspmbqoargytwjfxaxblfvldscivuybhrrvujjuartvoecngzoshjfkehuzdtcmkvigetaglvdbafoifdamohyupstslwfxtpdyiggvbkwdrlmwqokgwiblbwfoummodromxujbggeytqwjhjrdrsqurxllmzzpqpbqmnrstvsoorzvaqatlqqcpbpbarrsguishzlcvfqlwpiyiiutakxrnmtndmhkgqcqrpuoxlzvchukrqftaclnpecuqjeybjqtalhzyhvcqrpkhudhzowquykkjrllcdeeqleqsbtlukvbeykfngxhgkupdhahmeldqrtksoxmyspftzkihkrpunhxuhejormgjhsdwqswihb"
                expect(solution.convert(s, 144)).to(equal(""))
            }
        }
    }
}
