//
//  Food.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

final class FoodNutrition {
    var name: String
    var calories: Double
    var servings: Double
    var carbon_kg: Double
    var gramPerServing: Int
    
    init(name: String, calories: Double, servings: Double, carbon_kg: Double, gramPerServing: Int){
        self.name = name
        self.calories = calories
        self.servings = servings
        self.carbon_kg = carbon_kg
        self.gramPerServing = gramPerServing
    }
    
    static let nutrition: [FoodNutrition] = [
    
        FoodNutrition(name: "fries", calories: 365, servings: 1, carbon_kg: 0.672, gramPerServing: 117),
        FoodNutrition(name: "cheese", calories: 113, servings: 1, carbon_kg: 0.242, gramPerServing: 28),
        FoodNutrition(name: "bacon", calories: 161, servings: 3, carbon_kg: 0.212, gramPerServing: 35),
        FoodNutrition(name: "tomato", calories: 22, servings: 1, carbon_kg: 0.064, gramPerServing: 123),
        FoodNutrition(name: "onion", calories: 41, servings: 1, carbon_kg: 0.035, gramPerServing: 94),
        FoodNutrition(name: "pickles", calories: 4.2, servings: 1, carbon_kg: 0.030, gramPerServing: 35)
    
    ]
}


