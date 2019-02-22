//
//  HabitsTableViewControllerExtension.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 12/22/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit


extension HabitsTableViewController {
    
    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
}



