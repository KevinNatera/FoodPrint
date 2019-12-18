//
//  FoodPersistence.swift
//  foodprint-hackathon-app
//
//  Created by EricM on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct FoodPersistenceHelper {
    
   static let manager = FoodPersistenceHelper()
    
    func saveUser(newUser: Food) throws {
    try persistenceHelper.save(newElement: newUser)
    }
    
    func getUser() throws -> [Food] {
        return try persistenceHelper.getObjects()
    }
    
    private let persistenceHelper = PersistenceHelper<Food>(fileName: "mySavedFood.plist")
    
    private init() {}
    
}
