//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 12/18/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    var habitImage: Habit.Images!
    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var habitNameInputField: UITextField!
    
    @IBAction func createHabitButtonPressed(_ sender: UIButton) {
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else { return }
        persistenceLayer.createNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
   
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage.image
    }



   
}
