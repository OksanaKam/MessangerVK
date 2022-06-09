//
//  FriendProfileCollectionViewCell.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 22.04.2022.
//

import UIKit

class FriendProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet var friendAvatar: UIImageView!
    
    @IBOutlet var friendName: UILabel!
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        friendAvatar.layer.cornerRadius = self.friendAvatar.frame.size.width / 2.0
        friendAvatar.clipsToBounds = true
        friendAvatar.layer.masksToBounds = true
        friendAvatar.contentMode = .scaleToFill
        
        friendName.font = UIFont.systemFont(ofSize: 12)
        friendName.textColor = .black
        friendName.textAlignment = .center
        friendName.numberOfLines = 2
        
    }
    /*
    override func reset() {
        super.reset()
        
        self.friendName.text = nil
        self.friendAvatar.image = nil
    }
*/
}
