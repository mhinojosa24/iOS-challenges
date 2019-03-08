//
//  Model.swift
//  AssessMOB-1.2
//
//  Created by Maximo Hinojosa on 3/7/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class User {
    let name: String
    let lastName: String
    let age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
}
