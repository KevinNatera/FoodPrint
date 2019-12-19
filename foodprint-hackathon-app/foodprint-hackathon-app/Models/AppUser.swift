//
//  AppUser.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

class AppUser: Codable {
    
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    var sex: String
    var userId: UUID
    var bmr: Double {
        if self.sex == "male" {
            let newWeight = 6.24 * weight
            let newHeight = (12 * height) * 12.7
            let newAge = 6.755 * Double(age)
            return 66.47 + newWeight + newHeight - newAge
        } else {
            let newWeight = 4.35 * weight
            let newHeight = (12 * height) * 4.7
            let newAge = 4.7 * Double(age)
            return 655.1 + newWeight + newHeight - newAge
        }
    }
    
    let avgEmissionPerDay: Int = 2268 //2.5 tons 2268 kgs
    
    //This should be a computed property based on BMI using height and weight
    var caloriesPerDayGoal: Int {
        return Int(bmr)
    }
    
    var foodHistory: [Food]?
    
    //This should be the sum of all the calories of Food in foodHistory
    var currentCalories: Int? {
        var sum = 0
        if let food = self.foodHistory {
            for i in food {
                sum += i.calories
            }
        }
        return sum
    }
    //This should be the sum of all the emissions of Food in foodHistory
    var currentEmissions: Int? {
        var sum = 0.0
        if let food = self.foodHistory {
            for i in food {
                sum += i.carbonEmissionsGramsPerServing
            }
        }
        return Int(sum)
    }
    
    func addToFoodHistory(food: Food) {
        if self.foodHistory != nil {
            self.foodHistory?.append(food)
        } else {
            self.foodHistory = [food]
        }
    }
        
    func changeSettings(name: String, height: Double, weight: Double, age: Int, sex: String) {
        self.name = name
        self.height = height
        self.weight = weight
        self.age = age
        self.sex = sex
    }
    
    init(name: String, height: Double , weight: Double, age: Int, sex: String){
        self.name = name
        self.height = height
        self.weight = weight
        self.age = age
        self.sex = sex
        self.userId = UUID()
    }
    
    
}
