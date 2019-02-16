//
//  NewFriendsViewController.swift
//  TableViewPractice
//
//  Created by Maximo Hinojosa on 2/15/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class NewFriendsViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    var isEditingEntry = false
    var friend: Friend!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let name = firstNameTF.text else {
            print("Ooops name is nil")
            return
        }
        guard let lastName = lastNameTF.text else {
            print("Ooops last name is nil")
            return
        }
        
        friend = Friend(name: name, lastName: lastName)
        
        self.performSegue(withIdentifier: "unwind to all friends", sender: self)
        //let segue = UIStoryboardSegue(identifier: "add new friends", source: NewFriendsViewController(), destination: ViewController())
       // unwind(for: segue, towards: ViewController())
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier){
        case "add new friends":
           
    
            break
        default:
            break
            
        }
        
    }
    
    
}
