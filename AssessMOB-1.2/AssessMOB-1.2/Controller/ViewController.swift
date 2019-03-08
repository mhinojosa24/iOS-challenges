//
//  ViewController.swift
//  AssessMOB-1.2
//
//  Created by Maximo Hinojosa on 3/7/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var users: [User] = []
    
    let user1 = User(name: "Jimi", lastName: "Hendrix", age: 50)
    let user2 = User(name: "Eddie Van", lastName: "Halen", age: 45)
    let user3 = User(name: "John", lastName: "Lennon", age: 40)
    let user4 = User(name: "Joan", lastName: "Jett", age: 38)
    let user5 = User(name: "Brian", lastName: "May", age: 55)
    let user6 = User(name: "Carlos", lastName: "Santan", age: 48)
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users.append(user1)
        users.append(user2)
        users.append(user3)
        users.append(user4)
        users.append(user5)
        users.append(user6)

        tableView.delegate = self
        tableView.dataSource = self
        
    }



}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = "\(users[indexPath.row].name)  \(users[indexPath.row].lastName)"
        cell.ageLabel.text = "\(users[indexPath.row].age)"
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEntry = users[indexPath.row]
        
        let alert = UIAlertController(title: "Congrats", message: "You have a new friend", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print("Selected mood was \(selectedEntry.name)")
        
    }
    
}
