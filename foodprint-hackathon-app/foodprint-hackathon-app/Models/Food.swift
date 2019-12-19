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
    var category: String
    var calories: Int
    var carbonEmissionsGramsPerServing: Double
    var gramsPerServing: Int
    var servings: Double?
    
    init(name: String, category: String, calories: Int, carbonEmissionsGramsPerServing: Double, gramPerServing: Int, servings: Double?){
        self.name = name
        self.category = category
        self.calories = calories
        self.carbonEmissionsGramsPerServing = carbonEmissionsGramsPerServing
        self.gramsPerServing = gramPerServing
        self.servings = servings
    }
    
    static let foodList: [Food] = [
        Food(name: "Fries",category: "Vegetable" , calories: 365, carbonEmissionsGramsPerServing: 672.0, gramPerServing: 117, servings: nil),
        Food(name: "Cheese",category: "Dairy" , calories: 113, carbonEmissionsGramsPerServing: 242.0, gramPerServing: 28, servings: nil),
        Food(name: "Bacon",category: "Meat" , calories: 161, carbonEmissionsGramsPerServing: 212.0, gramPerServing: 35, servings: nil),
        Food(name: "Tomato",category: "Vegetable" , calories: 22, carbonEmissionsGramsPerServing: 64.0, gramPerServing: 123, servings: nil),
        Food(name: "Onion",category: "Vegetable" , calories: 41, carbonEmissionsGramsPerServing: 35.0, gramPerServing: 94, servings: nil),
        Food(name: "Pickles",category: "Vegetable", calories: 4, carbonEmissionsGramsPerServing: 30.0, gramPerServing: 35, servings: nil),
        Food(name: "Burger Bun",category: "Bread", calories: 128, carbonEmissionsGramsPerServing: 50.0, gramPerServing: 46, servings: nil),
        Food(name: "Beef Patty",category: "Meat", calories: 197, carbonEmissionsGramsPerServing: 838.0, gramPerServing: 85, servings: nil),
        Food(name: "Lettuce",category: "Vegetable", calories: 2, carbonEmissionsGramsPerServing: 3.0, gramPerServing: 12, servings: nil),
        Food(name: "Veggie Patty",category: "Vegetable", calories: 124, carbonEmissionsGramsPerServing: 308.0, gramPerServing: 85, servings: nil)
    ]
}


