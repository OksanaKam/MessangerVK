//
//  CommunityCell.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 23.02.2022.
//

import UIKit

class CommunityCell: UITableViewCell {

    
    @IBOutlet weak var labelCommunity: UILabel!
    @IBOutlet weak var imageCommunity: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    var model: GroupsAPI? {
        didSet {
            if let urlString = model?.photo100,
               let url = URL(string: urlString),
               let data = try? Data(contentsOf: url) {
                imageCommunity.image = UIImage(data: data)
            }
            labelCommunity.text = model?.groupName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageCommunity.layer.cornerRadius = self.frame.height / 2.0
        imageCommunity.layer.masksToBounds = true
        
        shadowView.layer.cornerRadius = self.frame.height / 2.0
        shadowView.layer.masksToBounds = false
        
        shadowView.layer.shadowColor = UIColor.blue.cgColor
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = .zero
        shadowView.backgroundColor = .clear
        
        imageCommunity.frame = shadowView.bounds
        imageCommunity.autoresizingMask = [
            .flexibleWidth, .flexibleHeight]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar(_:)))
        tap.numberOfTapsRequired = 1
        imageCommunity.addGestureRecognizer(tap)
        imageCommunity.isUserInteractionEnabled = true
        
        shadowView.addSubview(imageCommunity)
    }
    
    @objc func tapOnAvatar(_ tapGestureRecognizer: UIGestureRecognizer) {
         UIView.animate(withDuration: 0.1,
                        delay: 0,
                        usingSpringWithDamping: 0.3,
                        initialSpringVelocity: 1,
                        options: [.autoreverse],
                        animations: {
                         let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                         self.imageCommunity.transform = scale
                         self.shadowView.transform = scale
         })
             self.imageCommunity.transform = .identity
             self.shadowView.transform = .identity
    }
}
