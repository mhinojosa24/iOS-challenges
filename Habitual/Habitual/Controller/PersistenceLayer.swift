//
//  PersistenceLayer.swift
//  Habitual
//
//  Created by Maximo Hinojosa on 12/16/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit

struct PersistenceLayer {
    
    private(set) var habits: [Habit] = []
    
    private static let userDefaultsHabitKeyValue = "HABITS_ARRAY"
    
    private mutating func loadHabits() {
        
        let userDefaults = UserDefaults.standard
        
        guard
            let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultsHabitKeyValue),
            let habits = try? JSONDecoder().decode([Habit].self, from: habitData) else {
                return
        }
        
        self.habits = habits
    }
    
    @discardableResult
    
    mutating func createNewHabit(name: String, image: Habit.Images) -> Habit {
        let newHabit = Habit(title: name, image: image)
        self.habits.insert(newHabit, at: 0)
        self.saveHabits()
        
        return newHabit
    }
    
    // save habit
    private func saveHabits() {
        guard let habitsData = try? JSONEncoder().encode(self.habits) else {
            fatalError("could not encode list of habits")
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(habitsData, forKey: PersistenceLayer.userDefaultsHabitKeyValue)
    }
    
    // delete habit
    mutating func delete(_ habitIndex: Int) {
         // remove habit at the given index
        self.habits.remove(at: habitIndex)
        
        // persist the changes we made to our habits array
        self.saveHabits()
    }
    
    
    mutating func markHabitAsCompleted(_ habitIndex: Int) -> Habit {
        
        var updatedHabit = self.habits[habitIndex]
        guard updatedHabit.hasCompletedForToday == false else { return updatedHabit }
        updatedHabit.numberOfCompletions += 1
        
        if let lastCompletionDate = updatedHabit.lastCompletionDate, lastCompletionDate.isYesterday {
            updatedHabit.currentStreak += 1
        } else {
            updatedHabit.currentStreak = 1
        }
        
        if updatedHabit.currentStreak > updatedHabit.bestStreak {
            updatedHabit.bestStreak = updatedHabit.currentStreak
        }
        
        let now = Date()
        updatedHabit.lastCompletionDate = now
        
        self.habits[habitIndex] = updatedHabit
        self.saveHabits()
        
        return updatedHabit
    }
    
    mutating func swapHabit(habitIndex: Int, destinationIndex: Int) {
        let habitToSwap = self.habits[habitIndex]
        self.habits.remove(at: habitIndex)
        self.habits.insert(habitToSwap, at: destinationIndex)
        self.saveHabits()
    }
    
    mutating func setNeedsToReloadHabits() {
        self.loadHabits()
    }
    
    init(){
        self.loadHabits()
    }
}
