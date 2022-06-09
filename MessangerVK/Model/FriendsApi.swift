//
//  FriendsApi.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 12.05.2022.
//

import Foundation
import RealmSwift

class FriendsAPI: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo100: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

struct FriendsResponse: Decodable {
    var response: FriendsData
}

struct FriendsData: Decodable {
    var count: Int
    var items: [FriendsAPI]
}

/*
enum FriendsResponse {
    struct Response<T: Decodable>:Decodable {
        let response: Items<T>
    }
    struct Items<T:Decodable>: Decodable {
        let items: [T]
    }

    enum FriendsScene {
        struct FriendsAPI: Decodable {
            let id: Int
            let firstName: String
            let lastName: String
            let photo100: String

    
            enum CodingKeys: String, CodingKey {
                case id
                case firstName = "first_name"
                case lastName = "last_name"
                case photo100 = "photo_100"
            }
        }
    }
}
*/
