//
//  Communities.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 23.02.2022.
//

import UIKit

class Communities {
    
    let image: UIImage?
    let name: String
    
    init(image: UIImage? = nil, name: String) {
        self.image = image
        self.name = name
    }
    
    class func generateCommunitiesArray() -> [Communities] {
        
        var communitiesArray = [Communities]()
        
        communitiesArray.append(Communities(image: UIImage.init(named: "mars"), name: "Есть ли жизнь на Марсе"))
        communitiesArray.append(Communities(image: UIImage.init(named: "knigi"), name: "Книжная полка"))
        communitiesArray.append(Communities(image: UIImage.init(named: "onekotan"), name: "Курилы"))
        communitiesArray.append(Communities(image: UIImage.init(named: "cveti"), name: "Я художник, я так вижу"))
        
        return communitiesArray
    }
}

