//
//  PhotosApi.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 17.05.2022.
//

import Foundation
import RealmSwift

class PhotosAPI: Decodable {
    var sizes: [SizePhoto] = []
}

class SizePhoto: Decodable {
    var type: String = ""
    var url: String = ""
}

struct PhotosResponse: Decodable {
    var response: PhotosData
}

struct PhotosData: Decodable {
    var items: [PhotosAPI]
}
