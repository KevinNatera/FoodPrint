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
    var height: Double
    var weight: Double
    
    let avgEmissionPerDay: Int = 2500 //2.5 tons 2500 kgs
    
    //This should be a computed property based on BMI using height and weight
    var caloriesPerDayGoal: Int {
        return 50
    }
    
    var foodHistory: [Food]?
    
    //This should be the sum of all the calories of Food in foodHistory
    var currentCalories: Int? {
        return 50
    }
    //This should be the sum of all the emissions of Food in foodHistory
    var currentEmissions: Int? {
        return 50
    }
    
    
    
    init(name: String, height: Double , weight: Double){
        self.name = name
        self.height = height
        self.weight = weight
    }
    
    
}
