
//  ThirdViewController.swift
//  ConstraintsChallenge
//
//  Created by Maximo Hinojosa on 1/31/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
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
        view.backgroundColor = .white
        navigationItem.title = "Third View Controller"
    }
    
    func addViews() {
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(nextButton)
    }
    
    
    func addConstraints() {
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        //view1
        let topView1 = view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        let leftView1 = view1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 40)
        let rightView1 = view1.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 160)
        let bottomView1 = view1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4.5 * (UIScreen.main.bounds.width * 0.33))
        
        //view2
        let topView2 = view2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        let leftView2 = view2.leftAnchor.constraint(equalTo: view1.rightAnchor, constant: -140)
        let rightView2 = view2.rightAnchor.constraint(equalTo: view1.rightAnchor, constant: -160)
        let bottomView2 = view2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4.5 * (UIScreen.main.bounds.width * 0.33))
        
        //nextButton
        let btnBottom = nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        let btnRight = nextButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -40)
        
        NSLayoutConstraint.activate([topView1,
                                     leftView1,
                                     rightView1,
                                     bottomView1,
                                     topView2,
                                     leftView2,
                                     rightView2,
                                     bottomView2,
                                     btnBottom,
                                     btnRight,
                                     ])
        
        nextButton.constraintView(width: 100, height: 50)
        nextButton.dropShadow(color: .black, shadowRadius: 5, opacity: 0.5)
    }
    
    
    
    @objc func nextButtonPressed(_ sender: UIButton){
        
        let destinationVC = ThirdViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}
