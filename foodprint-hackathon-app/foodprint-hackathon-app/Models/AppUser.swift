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
    
    init(name: String, height: Double , weight: Double){
        self.name = name
        self.height = height
        self.weight = weight
    }
    
    
}
