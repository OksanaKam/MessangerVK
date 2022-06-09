//
//  NetworkService.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 17.05.2022.
//

import Foundation
import Alamofire
import RealmSwift

class NetworkService {
    static let shared = NetworkService()
    private let decoder = JSONDecoder()
    
    //typealias GroupsResult = Result<[GroupsAPI], Constants.Service>
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()

    var friendData = FriendData()
    
    var groups: [GroupsAPI] = [] {
        didSet {
            updateGroups?(groups)
        }
    }
    
    var updateGroups: (([GroupsAPI])->Void)?

    func getFriend(completion: @escaping ([FriendsAPI]) -> Void) {
        guard let token = Singleton.instance.token
        else { return }
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_100"),
            URLQueryItem(name: "v", value: "5.131")
        ]
    
        session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            if let error = error {
                print(Constants.Service.ServiceError.requestError(error))
                //print(error)
                //return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let result = try self.decoder.decode(FriendsResponse.self, from: data).response.items
                //self.friendData.friends = json.response.items
                DispatchQueue.main.async {
                    self.updateFriends(friends: result)
                }
            } catch {
                //print(error)
                print(Constants.Service.ServiceError.parseError)
            }
        }.resume()
        //return
    }
    
    func getPhotos(by id: String, completion: @escaping ([PhotosAPI])->Void) {
        guard let token = Singleton.instance.token
        else { return }
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/photos.getAll"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "owner_id", value: id),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "album_id", value: "profile")
        ]
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONDecoder().decode(PhotosResponse.self, from: data)
                completion(json.response.items)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func getGroups(completion: @escaping ([GroupsAPI]) -> Void) {
        guard let token = Singleton.instance.token
        else { return }
        guard let userID = Singleton.instance.userId
        else { return }
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "owner_id", value: String(userID)),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "extended", value: "1")
        ]
        print(urlComponents)
        
        URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let result = try self.decoder.decode(GroupsResponse.self, from: data).response.items
                //self.groups = json.response.items
                DispatchQueue.main.async {
                    self.updateGroup(groups: result)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func searchGroups(by name: String, completion: @escaping ([GroupsAPI])->Void ) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/groups.search"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: Singleton.instance.token),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "q", value: name)
        ]
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONDecoder().decode(GroupsResponse.self, from: data)
                print(json)
                completion(json.response.items)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}

private extension NetworkService {
    func updateFriends(friends: [FriendsAPI]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL ?? "")
            let oldValues = realm.objects(FriendsAPI.self)
            realm.beginWrite()
            realm.delete(oldValues)
            realm.add(friends)
            try realm.commitWrite()
            //try realm.write {
            //    realm.add(friends, update: .modified)
            //}
        } catch {
            print(error)
        }
}
    
    func updateGroup(groups: [GroupsAPI]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL ?? "")
            //let oldValues = realm.objects(GroupsAPI.self)
            //realm.beginWrite()
            //realm.delete(oldValues)
            //realm.add(groups)
            //try realm.commitWrite()
            try realm.write {
                realm.add(groups, update: .modified)
            }
        } catch {
            print(error)
    }
}
}
