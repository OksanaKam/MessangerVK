//
//  FriendData.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 17.05.2022.
//

import Foundation
import UIKit

class FriendData {
    // MARK: Public Properties
    var friends: [FriendsAPI] = [] {
        didSet {
            self.sortedFriends = sortFriends()
            self.updateFriends?(self.friends)
        }
    }
    
    var sortedFriends: [Character: [FriendsAPI]] = [:]
    
    var searchString: String = "" {
        didSet {
            sortedFriends = sortFriends()
        }
    }
    
    var alphabet: [Character] = []
    
    // MARK: Update methods
    var updateFriends: (([FriendsAPI])->Void)?
   
    // MARK: Public Functions
    func sortedFriends(for indexPath: IndexPath) -> FriendsAPI? {
        let key = sortedFriends.keys.sorted()[indexPath.section]
        let value = sortedFriends[key]!
        return value[indexPath.row]
    }
    
    // MARK: Private Functions
    private func sortFriends() -> [Character: [FriendsAPI]] {
        var sorted: [Character: [FriendsAPI]] = [:]
        
        for friend in friends
            where (friend.firstName.contains(searchString) || friend.lastName.contains(searchString) ||
                searchString == "")
        {
            guard let char = friend.firstName.first else {
                break
            }
            
            if sorted.keys.contains(char) {
                sorted[char]?.append(friend)
            } else {
                sorted[char] = [friend]
            }
        }
        alphabet = sorted.keys.sorted(by: <)
        return sorted
    }
}

