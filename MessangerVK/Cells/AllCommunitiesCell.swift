//
//  AllCommunitiesCell.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 24.02.2022.
//

import UIKit

class AllCommunitiesCell: UITableViewCell {

    
    @IBOutlet weak var allCommunitiesImage: UIImageView!
    @IBOutlet weak var allCommunitiesLabel: UILabel!
    
    var model: GroupsAPI? {
        didSet {
            if let urlString = model?.photo100,
               let url = URL(string: urlString),
               let data = try? Data(contentsOf: url) {
                allCommunitiesImage.image = UIImage(data: data)
            }
            allCommunitiesLabel.text = model?.groupName
        }
    }

}
