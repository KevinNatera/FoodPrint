//
//  Food.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

class Food: Codable{
    var name: String
    var calories: Int
    var carbonEmissionsKgPerServing: Double
    var gramsPerServing: Int
    var servings: Double?
    
    init(name: String, calories: Int, carbonEmissionsKgPerServing: Double, gramPerServing: Int, servings: Double?){
        self.name = name
        self.calories = calories
        self.carbonEmissionsKgPerServing = carbonEmissionsKgPerServing
        self.gramsPerServing = gramPerServing
        self.servings = servings
    }
    
    static let foodList: [Food] = [
        Food(name: "Fries", calories: 365, carbonEmissionsKgPerServing: 0.672, gramPerServing: 117, servings: nil),
        Food(name: "Cheese", calories: 113, carbonEmissionsKgPerServing: 0.242, gramPerServing: 28, servings: nil),
        Food(name: "Bacon", calories: 161, carbonEmissionsKgPerServing: 0.212, gramPerServing: 35, servings: nil),
        Food(name: "Tomato", calories: 22, carbonEmissionsKgPerServing: 0.064, gramPerServing: 123, servings: nil),
        Food(name: "Onion", calories: 41, carbonEmissionsKgPerServing: 0.035, gramPerServing: 94, servings: nil),
        Food(name: "Pickles", calories: 4, carbonEmissionsKgPerServing: 0.03, gramPerServing: 35, servings: nil),
        Food(name: "Burger Bun", calories: 128, carbonEmissionsKgPerServing: 0.05, gramPerServing: 46, servings: nil),
        Food(name: "Beef Patty", calories: 197, carbonEmissionsKgPerServing: 0.838, gramPerServing: 85, servings: nil),
        Food(name: "Lettuce", calories: 2, carbonEmissionsKgPerServing: 0.003, gramPerServing: 12, servings: nil),
        Food(name: "Veggie Patty", calories: 124, carbonEmissionsKgPerServing: 0.308, gramPerServing: 85, servings: nil)
    ]
}


