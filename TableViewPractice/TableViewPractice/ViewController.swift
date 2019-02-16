//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Maximo Hinojosa on 2/8/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var friends: [Friend] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsTableViewCell
        let friendsEntry = friends[indexPath.row]
        cell.name.text = "\(friendsEntry.name) \(friendsEntry.lastName)"
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEntry = friends[indexPath.row]
        
        let alert = UIAlertController(title: "Congrats", message: "You have a new friend", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print("Selected mood was \(selectedEntry.name)")
        
        
        
        
    }
    
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        //let addedFriend = subsequentVC.friends.append()
        if sender.source is NewFriendsViewController {
            if let senderVC = sender.source as? NewFriendsViewController {
                friends.append(senderVC.friend)
                tableView.reloadData()
                print(friends.count)
            }
        }
        
    }

}

