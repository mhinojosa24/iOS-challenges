//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 12/15/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        
    return self.init(nibName: String(describing: self), bundle: nil)
    }
}
