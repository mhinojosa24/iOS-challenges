//
//  Date.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 12/16/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit


extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
    
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInYesterday(self)
    }
}


