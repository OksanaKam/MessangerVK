//
//  PhotoViewController.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 23.02.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoViewController: UICollectionViewController {
    
    var friend: FriendsAPI? {
        didSet {
            self.title = friend?.firstName
            NetworkService.shared.getPhotos(by: String(friend?.id ?? 0)) { (photos) in
                self.photos = photos
            }
        }
    }
    
    private var photos: [PhotosAPI] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoViewCell
        if let urlString = self.photos[indexPath.row].sizes.last?.url,
            let url = URL(string: urlString),
            let data = try? Data(contentsOf: url) {
            cell.photoImageView.image = UIImage(data: data)
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoFriend" {
            guard let photoFriendVC = segue.destination as? PhotoImageViewController else { return }
            
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                photoFriendVC.numOfPhotos = photos
                photoFriendVC.photoIndex = indexPath.row
            }
        }
        //performSegue(withIdentifier: "PhotoFriend", sender: nil)
    }
    
    }
   
extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 3*15) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}




