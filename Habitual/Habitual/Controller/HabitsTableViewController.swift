//
//  MainViewController.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 12/15/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit

import UIKit

class HabitsTableViewController: UITableViewController {
    
    
    private var persistance = PersistenceLayer()
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistance.habits.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
        let habit = persistance.habits[indexPath.row]
        cell.configure(habit)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedHabit = persistance.habits[indexPath.row]
        let habitDetailedVC = HabitDetailedViewController.instantiate()
        habitDetailedVC.habit = selectedHabit
        habitDetailedVC.habitIndex = indexPath.row
        navigationController?.pushViewController(habitDetailedVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            
            let habitToDelete = persistance.habits[indexPath.row]
            let habitIndexToDelete = indexPath.row
            
            let deleteAlert = UIAlertController(habitTitle: habitToDelete.title) {
                self.persistance.delete(habitIndexToDelete)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            self.present(deleteAlert, animated: true)
            
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        persistance.swapHabit(habitIndex: sourceIndexPath.row, destinationIndex: destinationIndexPath.row)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            HabitTableViewCell.nib,
            forCellReuseIdentifier: HabitTableViewCell.identifier
        )
        setupNavBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        persistance.setNeedsToReloadHabits()
        tableView.reloadData()
        
    }
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        let addHabitVc = AddHabitViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addHabitVc)
        present(navigationController, animated: true, completion: nil)
        
    }
    

}
