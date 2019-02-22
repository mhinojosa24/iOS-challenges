//
//  AddHabitViewController.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 12/28/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController {
    let habitImages = Habit.Images.allCases
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HabitImageCollectionViewCell.nib, forCellWithReuseIdentifier: HabitImageCollectionViewCell.identifier)
        
        setupNavbar()
    }

    @IBAction func pickPhotoButtonPressed(_ sender: UIButton) {

        guard let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let confirmHabitVC = ConfirmHabitViewController.instantiate()
        confirmHabitVC.habitImage = habitImages[selectedIndexPath.row]
        navigationController?.pushViewController(confirmHabitVC, animated: true)
    }
    
    
    
    func setupNavbar() {
        title = "Select Image"

        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddHabit(_:)))
        navigationItem.leftBarButtonItem = cancelButton

    }
    
    @objc func cancelAddHabit(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
