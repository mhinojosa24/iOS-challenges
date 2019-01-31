//
//  ViewController.swift
//  ConstraintsChallenge
//
//  Created by Maximo Hinojosa on 1/30/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let view1: UIView = {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return view
    }()
    
    let view2: UIView = {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        addConstraints()
        
        navigationController?.navigationBar.isHidden = true
    }

    
    func addViews() {
        view.addSubview(view1)
        view.addSubview(view2)
    }
    
    
    func addConstraints() {
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        
        view1.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        view1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1 * (UIScreen.main.bounds.height / 1.8)).isActive = true
        view1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        view1.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
     
        view2.topAnchor.constraint(equalTo: view1.bottomAnchor).isActive = true
        view2.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        view2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    
    
    

}

