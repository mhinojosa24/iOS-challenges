//
//  HabitDetailedViewController.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 12/28/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit

class HabitDetailedViewController: UIViewController {

    // variables
    var habit: Habit!
    var habitIndex: Int!
    
    private var persistance = PersistenceLayer()
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var labelTotalCompletions: UILabel!
    @IBOutlet weak var labelBestStreak: UILabel!
    @IBOutlet weak var labelStartingDate: UILabel!
    @IBOutlet weak var buttonAction: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func pressActionButton(_ sender: UIButton) {
        
        habit = persistance.markHabitAsCompleted(habitIndex)
        
        updateUI()
    }
    
    private func updateUI() {
    
        title = habit.title
        imageViewIcon.image = habit.selectedImage.image
        labelCurrentStreak.text = "\(habit.currentStreak) days"
        labelTotalCompletions.text = String(habit.numberOfCompletions)
        labelBestStreak.text = String(habit.bestStreak)
        labelStartingDate.text = habit.dateCreated.stringValue
        
        if habit.hasCompletedForToday {
            buttonAction.setTitle("Completed for Today!", for: .normal)
        } else {
            buttonAction.setTitle("Mark as Completed", for: .normal)
        }
    }
    
}
