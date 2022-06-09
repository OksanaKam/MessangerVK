//
//  FriendCell.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 22.02.2022.
//

import UIKit

class FriendCell: UITableViewCell {
   
    @IBOutlet weak var friendImageViev: UIImageView!
    
    var avatarFriend: UIImage = UIImage() {
        didSet {
            friendImageViev.image = avatarFriend
        }
    }
    
    @IBOutlet weak var friendLabel: UILabel!
    
    @IBOutlet weak var shadowView: UIView!
    
    var model: FriendsAPI? {
        didSet {
            if let urlString = model?.photo100,
                let url = URL(string: urlString),
                let data = try? Data(contentsOf: url) {
                friendImageViev.image = UIImage(data: data)
            }
            friendLabel.text = "\(model?.firstName ?? "") \(model?.lastName ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendImageViev.layer.cornerRadius = 32
        //friendImageViev.layer.cornerRadius = self.frame.height / 2.0
        friendImageViev.layer.masksToBounds = true
        //friendImageViev.layer.masksToBounds = false
        
        shadowView.layer.cornerRadius = 32
        //shadowView.layer.cornerRadius = self.frame.height / 2.0
        shadowView.layer.masksToBounds = false
        
        shadowView.layer.shadowColor = UIColor.blue.cgColor
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = .zero
        
        friendImageViev.frame = shadowView.bounds
        friendImageViev.autoresizingMask = [
            .flexibleWidth, .flexibleHeight]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar(_:)))
        tap.numberOfTapsRequired = 1
        friendImageViev.addGestureRecognizer(tap)
        friendImageViev.isUserInteractionEnabled = true
        
        shadowView.addSubview(friendImageViev)
    }
    /*
    func configureCell(With model: Friends) {
        friendLabel.text = model.friendName
    }
    */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func tapOnAvatar(_ tapGestureRecognizer: UIGestureRecognizer) {
         UIView.animate(withDuration: 0.1,
                        delay: 0,
                        usingSpringWithDamping: 0.3,
                        initialSpringVelocity: 1,
                        options: [.autoreverse],
                        animations: {
                         let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                         self.friendImageViev.transform = scale
                         self.shadowView.transform = scale
         })
             self.friendImageViev.transform = .identity
             self.shadowView.transform = .identity
    }
}

