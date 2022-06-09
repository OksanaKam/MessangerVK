//
//  ProfileViewController.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 11.03.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet var profileName: UILabel!
    
    @IBOutlet var profileStatus: UILabel!
    
    @IBOutlet var editButton: UIButton!
    
    @IBOutlet var friends: UILabel!
    
    @IBOutlet var profileDrawningController: ProfileDrawningControl!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.dataSource = self
        }
    }
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet{
            collectionView.dataSource = self
        }
    }

    var profileVC: FriendsTableViewController!
    
    var friendData = NetworkService.shared.friendData

    //var friendsArray: [Friends] = []
    
    var posts: [Posts] = Posts.generatePostsArray()
    
    var numberOfFriends: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatar.layer.cornerRadius = 30
        avatar.clipsToBounds = true
        editButton.backgroundColor = .systemGray5
        editButton.tintColor = .systemBlue
        editButton.layer.cornerRadius = 15
        
        self.navigationItem.title = "Главная"
        self.view.addSubview(self.tableView)

        tableView.register(UINib(nibName: "NewsXIBTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsXIBTableViewCell")
        
        collectionView.register(UINib(nibName: "FriendProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FriendProfileCollectionViewCell")
        /*
        let tap = UIGestureRecognizer()
        tap.addTarget(self, action: #selector(tapOnAvatar(_:)))
        avatar.addGestureRecognizer(tap)
        avatar.isUserInteractionEnabled = true
        */
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar(_:)))
        tap.numberOfTapsRequired = 1
        avatar.addGestureRecognizer(tap)
        avatar.isUserInteractionEnabled = true
        
        numberOfFriends = friendData.alphabet.count
        
        //numberOfFriends = friendsArray.count
        let friendLabel: String = "Друзья"
        let friendNumber = String(numberOfFriends)
        friends.text = friendLabel + " " + friendNumber
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //profileDrawningController.setNeedsLayout()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc func tapOnAvatar(_ tapGestureRecignizer: UIGestureRecognizer) {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 1,
                       options: [.autoreverse],
                       animations: {
                        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                        self.avatar.transform = scale
        })
            self.avatar.transform = .identity
   }
}

    extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsXIBTableViewCell", for: indexPath) as? NewsXIBTableViewCell else {
            preconditionFailure("Error")
        }
        
        cell.avatarAuthor.image = posts[indexPath.row].avatar
        cell.nameAuthor.text = posts[indexPath.row].author
        cell.timePost.text = posts[indexPath.row].time
        cell.textPost.text = posts[indexPath.row].text
        cell.imagePost.image = posts[indexPath.row].image
        
        return cell
    }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    }

extension ProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendData.alphabet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendProfileCollectionViewCell", for: indexPath) as? FriendProfileCollectionViewCell else {
            preconditionFailure("Error")
        }
        
        //cell.friendAvatar.image = friendsArray[indexPath.row].friendAvatar
        //cell.friendName.text = friendsArray[indexPath.row].friendName
        
        return cell
    }
}
