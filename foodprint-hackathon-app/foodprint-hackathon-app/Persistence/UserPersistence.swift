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
    
    private let persistenceHelper = PersistenceHelper<AppUser>(fileName: "mySavedUsers.plist")
    
    private init() {}
    
}
