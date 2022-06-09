//
//  CommunitiesViewController.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 23.02.2022.
//

import UIKit
import RealmSwift

class CommunitiesViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableViewCommunities: UITableView!
    
    private var allGroups: [GroupsAPI] = [] {
        didSet {
            currentGroups = allGroups
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
     
    private var currentGroups: [GroupsAPI] = []

    private let service = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Мои сообщества"

        searchBar.delegate = self
        tableView.dataSource = self
        
        searchBar.searchTextField.textColor = UIColor.gray
        searchBar.placeholder = "Поиск"
       /*
        NetworkService.shared.getGroups()
        allGroups = NetworkService.shared.groups
        NetworkService.shared.updateGroups = { groups in
            //self.allGroups = groups
            self.loadGroupData()
        }
        tableView.reloadData()
       */
        service.getGroups { [weak self] group in
            self?.loadGroupData()
            self?.tableView?.reloadData()
        }
        //tableView.reloadData()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)
    }

    func loadGroupData() {
                do {
                    let realm = try Realm()
                    let groupsArray = realm.objects(GroupsAPI.self)
                    self.currentGroups = Array(groupsArray)
                } catch {
                    print(error)
                }
            }
    /*
    func loadGroups() {
        service.getGroups()
        loadGroupsFromRealm()
    }
    
    func loadGroupsFromRealm() {
        do {
            let realm = try Realm()
            let realmData = realm.objects(GroupsAPI.self)
            let groups = convertToGroupModel(with: Array(realmData))
            communities = groups
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch { print(error) }
    }
    
    func convertToGroupModel(with groups: [GroupsAPI]) -> [ItemModel] {
        let items = groups.compactMap { groups -> ItemModel in
            let item = ItemModel(id: groups.id,
                                 title: groups.groupName,
                                 subtitle: "",
                                 icon: groups.photo100)
            return item
        }
        return items
    }
    */
   
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
            //navigationController?.setNavigationBarHidden(false, animated: false)
        }
    /*
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentGroups = allGroups.filter({ (group) -> Bool in
            group.groupName.contains(searchText) || searchText.isEmpty
        })
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
     */
    /*
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterTableViev(text: searchText)
        if searchText.isEmpty {
            communityArray = Communities.generateCommunitiesArray()
        }
        self.tableView.reloadData()
    }
    
    func filterTableViev(text: String) {
        communityArray = communityArray.filter({ (item) -> Bool in
            return item.name.contains(text)
        })
        self.tableView.reloadData()
    }
   */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroups.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CommunityCell", for: indexPath) as! CommunityCell
        let group = currentGroups[indexPath.row]
        cell.labelCommunity.text = group.groupName
        cell.imageCommunity.image = UIImage(named: group.photo100)
       
       //return cell
        
        //cell.model = currentGroups[indexPath.row]
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCommunities",
           let destinationVC = segue.destination as? CommunitiesViewController,
            let IndexPath = tableView.indexPathForSelectedRow {
            let community = currentGroups[IndexPath.row].groupName
            //let community = communityArray[IndexPath.row].name
            destinationVC.title = community
        }
    }
    /*
    @IBAction func addSelectedCommunities(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AllCommunitiesController,
           let indexPath = sourceVC.tableView.indexPathForSelectedRow {
           let community = sourceVC.currentGroups[indexPath.row]
           if !currentGroups.contains(where: {$0.groupName == community.groupName}) {
               currentGroups.append(community)
            
                tableView.reloadData()
        }
        }
    }
    */
        /*
    // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            currentGroups.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
     */
    /*
    private func subscribeToNotificationRealm() {
        token = groupsFromRealm.observe { [weak self] (changes) in
            switch changes {
            case .initial:
                self?.loadGroupsFromRealm()
           
            case .update:
                self?.loadGroupsFromRealm()

            case let .error(error):
                print(error)
            }
        }
    }
    */
    @objc func willShowKeyboard(_ notification: Notification) {
        print(#function)
        
        //guard let info = notification.userInfo as NSDictionary?,
             // let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        // keyBoardHeight = keyboardSize.cgRectValue.size.height
        
       // scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardHeight, right: 0)
    }
    
    @objc func willHideKeyboard(_ notification: Notification) {
        print(#function)
        
        //guard let info = notification.userInfo as NSDictionary?,
            //  let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        //let keyBoardHeight = keyboardSize.cgRectValue.size.height
        
        //scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -keyBoardHeight, right: 0)
    }
    
    @objc func hideScreen() {
        view.endEditing(true)

}
}
