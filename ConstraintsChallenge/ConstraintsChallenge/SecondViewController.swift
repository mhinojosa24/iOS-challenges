//
//  secondViewController.swift
//  ConstraintsChallenge
//
//  Created by Maximo Hinojosa on 1/31/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
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
    
    let nextButton: UIButton = {
        let button = UIButton(title: "Next", backgroundColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        button.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        addConstraints()
        navigationItem.title = "Second View Controller"

    }
    
    func addViews() {
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(nextButton)
    }
    
    
    func addConstraints() {
        
        view1.setAnchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -1 * (UIScreen.main.bounds.height / 2.1), paddingRight: 0)
        
        view2.setAnchor(top: view1.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        nextButton.setAnchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -20, paddingRight: -40)
        nextButton.constraintView(width: 150, height: 50)
        nextButton.dropShadow(color: .black, shadowRadius: 5, opacity: 0.5)
    }
    
    @objc func nextButtonPressed(_ sender: UIButton){
        
        let destinationVC = ThirdViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}
