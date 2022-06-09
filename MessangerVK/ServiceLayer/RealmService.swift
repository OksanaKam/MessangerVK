//
//  RealmService.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 19.05.2022.
//

import Foundation
import RealmSwift

class RealmService {
    
    let realm = try! Realm()
    static let shared = RealmService()
    
    //private var networkService = NetworkService()
    
    
    func updateFriends(_ friends: [FriendsAPI]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL ?? "")
            realm.beginWrite()
            realm.add(friends)
            try realm.commitWrite()
        } catch {
            print(error)
        }
}
    func updateGroups(_ groups: [GroupsAPI]) {
        try! realm.write{
            realm.add(groups, update: .modified)
        }
}
    func getGroups() -> Results<GroupsAPI> {
        return realm.objects(GroupsAPI.self)
    }
       
    func deleteData() {
        try! realm.write{
            realm.deleteAll()
        }
    }
}
