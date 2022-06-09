//
//  LikeControl.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 17.03.2022.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet var like: UIImageView!
    
    var isLike: Bool = false
    
    override func awakeFromNib() {
        
        like.backgroundColor = .clear
        like.tintColor = .red
    }

}
