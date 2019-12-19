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
    var carbonEmissionsGramsPerServing: Double
    var gramsPerServing: Int
    var servings: Double?
    
    init(name: String, calories: Int, carbonEmissionsGramsPerServing: Double, gramPerServing: Int, servings: Double?){
        self.name = name
        self.calories = calories
        self.carbonEmissionsGramsPerServing = carbonEmissionsGramsPerServing
        self.gramsPerServing = gramPerServing
        self.servings = servings
    }
    
    static let foodList: [Food] = [
        Food(name: "Fries", calories: 365, carbonEmissionsGramsPerServing: 672.0, gramPerServing: 117, servings: nil),
        Food(name: "Cheese", calories: 113, carbonEmissionsGramsPerServing: 242.0, gramPerServing: 28, servings: nil),
        Food(name: "Bacon", calories: 161, carbonEmissionsGramsPerServing: 212.0, gramPerServing: 35, servings: nil),
        Food(name: "Tomato", calories: 22, carbonEmissionsGramsPerServing: 64.0, gramPerServing: 123, servings: nil),
        Food(name: "Onion", calories: 41, carbonEmissionsGramsPerServing: 35.0, gramPerServing: 94, servings: nil),
        Food(name: "Pickles", calories: 4, carbonEmissionsGramsPerServing: 30.0, gramPerServing: 35, servings: nil),
        Food(name: "Burger Bun", calories: 128, carbonEmissionsGramsPerServing: 50.0, gramPerServing: 46, servings: nil),
        Food(name: "Beef Patty", calories: 197, carbonEmissionsGramsPerServing: 838.0, gramPerServing: 85, servings: nil),
        Food(name: "Lettuce", calories: 2, carbonEmissionsGramsPerServing: 3.0, gramPerServing: 12, servings: nil),
        Food(name: "Veggie Patty", calories: 124, carbonEmissionsGramsPerServing: 308.0, gramPerServing: 85, servings: nil)
    ]
}


