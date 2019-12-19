//
//  AppTabBarVC.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

class AppTabBarVC: UITabBarController {
    
    //MARK: - UI Objects
    lazy var settingsVC: UINavigationController = {
    let navController = UINavigationController(rootViewController: SettingsVC())
    return navController
    }()
    
    lazy var homescreenVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: HomescreenVC())
        return navController
    }()
        
    lazy var foodHistoryVC: UINavigationController = {
    let navController = UINavigationController(rootViewController: FoodHistoryVC())
    return navController
    }()
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person.circle"), tag: 0)
        homescreenVC.tabBarItem = UITabBarItem(title: "Progress", image: UIImage(systemName: "chart.pie.fill"), tag: 1)
        foodHistoryVC.tabBarItem = UITabBarItem(title: "Food History", image: UIImage(systemName: "cart.fill"), tag: 2)
        
        self.viewControllers = [settingsVC, homescreenVC, foodHistoryVC]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
