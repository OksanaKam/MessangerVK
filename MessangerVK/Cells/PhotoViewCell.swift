//
//  PhotoViewCell.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 23.02.2022.
//

import UIKit

class PhotoViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIView!
    @IBOutlet weak var count: UILabel!
    
    //private var collectionView: UICollectionView?
    //private var index: Int?
    
    var likePress: Int = 0
    
    @IBAction func pressedLike(sender: Any) {
        likePress += 1
    }
    /*
    func configure(with photo: Photos, collectionView: UICollectionView, index: Int) {
        photoImageView.image = photo.image
        self.collectionView = collectionView
        self.index = index
    }
  */
    override func awakeFromNib() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 2
        container.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(likeTap))
        let likeString: String?
        
        switch likePress {
        case 0..<1000:
            likeString = String(self.likePress)
        case 1000..<100_000_000:
            likeString = String(self.likePress/1000) + "к"
        default:
            likeString = "-"
        }
       
        self.count.text = String(likeString!)
        
        UIView.transition(with: count,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
            self.count.text = String(likeString!)
        })
    }
    
    @objc func handleTap(_ : UITapGestureRecognizer) {
        likeControl.isLike.toggle()
        if likeControl.isLike {
            likeControl.like.image = UIImage(systemName: "heart.fill")
        } else {
            likeControl.like.image = UIImage(systemName: "heart")
        }
    }
    
    @objc func likeTap(_ : UITapGestureRecognizer) {
        if likeControl.isLike {
        likePress += 1
            awakeFromNib()
        print(likePress)
        } else {
            likePress -= 1
            awakeFromNib()
            print(likePress)
        }
    }
    
    }

