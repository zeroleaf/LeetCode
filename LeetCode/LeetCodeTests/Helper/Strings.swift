//
//  Strings.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/26.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import Foundation

extension String {

//    infix operator * {
//        associativity none
//        precedence 160
//    }

    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }

//    func * (lhs: String, rhs: Int) -> String {
//
//    }
}