//
//  AlertControllerExtension.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 2/22/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

extension UIAlertController {
    convenience init(habitTitle: String, confirmHandler: @escaping () -> Void ) {
        self.init(title: "Delete Habit", message: "Are you sure you want to delte \(habitTitle)", preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in
            confirmHandler()
        }
        self.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        self.addAction(cancelAction)
        
    }
}
