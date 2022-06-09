//
//  FriendsTableViewController.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 21.02.2022.
//

import UIKit
import RealmSwift

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBarFriends: UISearchBar! {
        didSet {
            searchBarFriends.delegate = self
        }
    }
    
    var friendData = NetworkService.shared.friendData
    
    private let network = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Друзья"
        
        //NetworkService.shared.getFriend()
        /*
        friendData.updateFriends = { friends in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        */
        /*
        friendData.updateFriends = { [weak self] friends in
            try? NetworkService.shared.getFriend()
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        */
        /*
        friendData.updateFriends = { [weak self] friends in
            try? NetworkService.shared.getFriend()
            DispatchQueue.main.async {
                self?.loadFriendData()
                self?.tableView.reloadData()
            }
        }
        */
        network.getFriend { [weak self] friends in
            self?.loadFriendData()
            self?.tableView?.reloadData()
        }
        
        searchBarFriends.searchTextField.textColor = UIColor.gray
        searchBarFriends.placeholder = "Поиск"
        
    }
    
    func loadFriendData() {
            do {
                let realm = try Realm()
                let friendArray = realm.objects(FriendsAPI.self)
                self.friendData.friends = Array(friendArray)
            } catch {
                print(error)
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
            navigationController?.setNavigationBarHidden(false, animated: false)
        }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        //friends.count
        friendData.alphabet.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = friendData.alphabet[section]
        return friendData.sortedFriends[key]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(friendData.alphabet[section])
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendCell
        else {
            return UITableViewCell()
        }
        
        let key = friendData.alphabet[indexPath.section]
        cell.model = friendData.sortedFriends[key]?[indexPath.row] ?? nil
        return cell
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photosFriend = segue.destination as? PhotoViewController {
            if let indexPath = tableView.indexPath(for: sender as! FriendCell) {
                photosFriend.friend = friendData.sortedFriends(for: indexPath)
            }
        }
    }
     
}
/*
//extension FriendsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    
        if searchText.isEmpty {
            filteredFriends = friendsArray
        } else {
            filteredFriends = friendsArray.filter {$0.name.contains(searchText)}
        }
        
        tableView.reloadData()
}
}
*/
