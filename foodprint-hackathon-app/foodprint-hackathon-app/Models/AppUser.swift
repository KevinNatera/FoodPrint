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
    
    var caloriesPerDayGoal: Int
    var avgEmissionPerDay: Int = 2500 //2.5 tons 2500 kgs
    //var foodHistory = [Food]
    var currentCalories: Int = 50
    var currentEmissions: Int = 20
    
    init(name: String, height: Double , weight: Double, caloriesPerDayGoal: Int, avgEmissionPerDay: Int){
        self.name = name
        self.height = height
        self.weight = weight
        
        self.caloriesPerDayGoal = caloriesPerDayGoal
        self.avgEmissionPerDay = avgEmissionPerDay
    }
    
    
    
    
}
