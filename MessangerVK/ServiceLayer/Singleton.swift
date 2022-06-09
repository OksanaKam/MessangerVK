//
//  Singleton.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 25.04.2022.
//

import Foundation

class Singleton {
    
    var userId: Int?
    var token: String?
    
    static let instance = Singleton()
    
    private init() { }
    
    func loginUser(with token: String, userID: Int) {
        self.token = token
        self.userId = userID
    }
    
}
