//
//  UserPersistence.swift
//  foodprint-hackathon-app
//
//  Created by EricM on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct AppUserPersistenceHelper {
    
   static let manager = AppUserPersistenceHelper()
    
    func saveUser(newUser: AppUser) throws {
        try persistenceHelper.save(newElement: newUser)
    }
    
    func getUser() throws -> [AppUser] {
        return try persistenceHelper.getObjects()
    }
    
    func updateUser(user: AppUser, name: String, height: Double, weight: Double, age: Int, sex: String) throws {
        do {
            let users = try getUser()
            try persistenceHelper.replace(elements: users.filter { $0.bmr == user.bmr})
            let newUser = AppUser(name: name, height: height, weight: weight, age: age, sex: sex)
            try persistenceHelper.save(newElement: newUser)
        }
    }
    
    func updateUserFoodHistory(user: AppUser, food: Food) throws {
        do {
            var foodArray = user.foodHistory
            foodArray.append(food)
            let users = try getUser()
            try persistenceHelper.replace(elements: users.filter { $0.bmr == user.bmr})
            let newUser = AppUser(name: user.name, height: user.height, weight: user.weight, age: user.age, sex: user.sex)
            newUser.foodHistory = foodArray
            try persistenceHelper.save(newElement: newUser)
        }
    }
    
    func updateUserCalorieGoal(user: AppUser, dailyCalorieGoal: Int) throws {
        do {
            let users = try getUser()
            try persistenceHelper.replace(elements: users.filter { $0.bmr == user.bmr})
            let newUser = AppUser(name: user.name, height: user.height, weight: user.weight, age: user.age, sex: user.sex)
            newUser.caloriesPerDayGoal = dailyCalorieGoal
            newUser.emissionsPerDayGoal = user.emissionsPerDayGoal
            try persistenceHelper.save(newElement: newUser)
        }
    }
    
    func updateUserEmissionGoal(user: AppUser, dailyEmissionGoal: Int) throws {
        do {
            let users = try getUser()
            try persistenceHelper.replace(elements: users.filter { $0.bmr == user.bmr})
            let newUser = AppUser(name: user.name, height: user.height, weight: user.weight, age: user.age, sex: user.sex)
            newUser.caloriesPerDayGoal = user.caloriesPerDayGoal
            newUser.emissionsPerDayGoal = dailyEmissionGoal
            try persistenceHelper.save(newElement: newUser)
        }
    }
    
    private let persistenceHelper = PersistenceHelper<AppUser>(fileName: "mySavedUsers.plist")
    
    private init() {}
    
}
