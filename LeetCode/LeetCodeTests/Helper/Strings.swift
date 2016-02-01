//
//  Strings.swift
//  LeetCode
//
//  Created by zeroleaf on 16/1/26.
//  Copyright © 2016年 zeroleaf. All rights reserved.
//

import Foundation

extension String {

    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
}