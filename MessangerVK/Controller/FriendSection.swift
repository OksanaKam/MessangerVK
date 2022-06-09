//
//  FriendSection.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 15.05.2022.
//

import Foundation

struct FriendSection: Comparable {

    let key: Character
    let data: [Friends]

    static func < (lhs: FriendSection, rhs: FriendSection) -> Bool {
        return lhs.key < rhs.key
    }

    static func == (lhs: FriendSection, rhs: FriendSection) -> Bool {
        return lhs.key == rhs.key
    }
}
