//
//  GroupsApi.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 17.05.2022.
//

import Foundation
import RealmSwift

class GroupsAPI: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var groupName: String = ""
    @objc dynamic var photo100: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case groupName = "name"
        case photo100 = "photo_100"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

struct GroupsResponse: Decodable {
    var response: GroupsData
}

struct GroupsData: Decodable {
    var count: Int
    var items: [GroupsAPI]
}
