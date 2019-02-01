//
//  UIButtonExtension.swift
//  ConstraintsChallenge
//
//  Created by Maximo Hinojosa on 1/31/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

extension UIButton {
    
    public convenience init(title: String, backgroundColor: UIColor) {
        self.init()
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 5
//        self.layer.borderWidth = 2
        self.backgroundColor = backgroundColor
        
    }
    
    func dropShadow(color: UIColor, shadowRadius: CGFloat, opacity: Float) {
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = opacity
    }
}
