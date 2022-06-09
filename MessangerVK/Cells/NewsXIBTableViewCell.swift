//
//  NewsXIBTableViewCell.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 22.03.2022.
//

import UIKit

class NewsXIBTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarAuthor: UIImageView!
    
    @IBOutlet weak var nameAuthor: UILabel!
    
    @IBOutlet weak var timePost: UILabel!
    
    @IBOutlet weak var textPost: UILabel!
    
    @IBOutlet weak var imagePost: UIImageView!
    
    @IBOutlet weak var countLike: UILabel!
    
    @IBOutlet weak var countMessage: UILabel!
    
    @IBOutlet weak var countShare: UILabel!
    
    @IBOutlet weak var countViewing: UILabel!
    
    @IBOutlet weak var viewing: NSLayoutConstraint!
    
    var likeCount: Int = 0
    var shareCount: Int = 0
    var viewCount: Int = 0
    var messageCount: Int = 0
    
    
     override func awakeFromNib() {
        super.awakeFromNib()
         
         avatarAuthor.layer.cornerRadius = 12
         avatarAuthor.clipsToBounds = true
         avatarAuthor.layer.masksToBounds = true
         avatarAuthor.contentMode = .scaleToFill
         
         countLike.text = "\(likeCount)"
         countShare.text = "\(shareCount)"
         countMessage.text = "\(messageCount)"
         countViewing.text = "\(viewCount)"

    }
    
    

   // override func setSelected(_ selected: Bool, animated: Bool) {
   //     super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
  //  }
    
}
