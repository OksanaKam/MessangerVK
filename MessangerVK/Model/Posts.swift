//
//  Posts.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 22.03.2022.
//

import UIKit


class Posts {
    let avatar: UIImage?
    let author: String
    let time: String
    let image: UIImage?
    let text: String
    
    init(avatar: UIImage? = nil, author: String, time: String, image: UIImage? = nil, text: String) {
        self.avatar = avatar
        self.author = author
        self.time = time
        self.image = image
        self.text = text
     
    }
    
    class func generatePostsArray() -> [Posts] {
        
        var postsArray = [Posts]()
        
        postsArray.append(Posts(avatar: UIImage(named: "mummi"), author: "Муми-троль", time: "30 марта в 12.15", image: UIImage(named: "csgtbAzG_DI"), text: "Мнение - оно как транспорт. У кого нет собственного, тот пользуется общественным."))
        postsArray.append(Posts(avatar: UIImage(named: "knigi"), author: "Книжная полка", time: "25 марта в 20.35", image: UIImage(named: "2x-QYvzPO1w"), text: "Психологическая зрелость — это понимание того, как много вещей в мире не нуждаются ни в твоих комментариях, ни в твоем мнении..."))
        
        
        return postsArray
    }
}

