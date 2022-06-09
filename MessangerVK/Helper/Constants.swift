//
//  Constants.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 12.05.2022.
//

import Foundation

struct Constants {
    enum Service: String, CaseIterable {
        enum TypeMethods: String, CaseIterable {
            case friendsGet = "/method/friends.get"
            case userGet = "/method/users.get"
            case groupsGet = "/method/groups.get"
            case photosGet = "/method/photos.getAll"
        }
        enum ServiceError: Error {
            case parseError
            case requestError(Error)
        }
        case scheme = "https"
        case host = "api.vk.com"
        case get = "GET"
        case post = "POST"
    }
}
