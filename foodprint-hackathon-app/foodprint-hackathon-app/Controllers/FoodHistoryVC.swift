//
//  FoodHistoryVC.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class FoodHistoryVC: UIViewController {
    
    //MARK: - Properties
    lazy var historyTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchFoodTVCell.self, forCellReuseIdentifier: "history")
        return tableView
    }()
    
    var foodHistory = [Food]() {
        didSet {
            historyTableView.reloadData()
        }
    }
    
    var currentUser: AppUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        addConstraints()
    }
    

  //MARK: - Private Methods
    private func loadUserData() {
        do {
            currentUser = try AppUserPersistenceHelper.manager.getUser().last
        } catch {
            print(error)
        }
        
        if currentUser != nil {
            updateFoodHistory()
        } else {
            //TODO: Show alert and pop back to SettingsVC
        }
    }
    
    private func updateFoodHistory() {
        foodHistory = currentUser!.foodHistory
    }
}


//MARK: - Extensions

extension FoodHistoryVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "history") as! SearchFoodTVCell
        
        let food = foodHistory[indexPath.row]
        
        cell.foodNameLabel.text = food.name
        cell.caloriesPerServingLabel.text = "Servings: \(food.servings ?? 0 )"
        cell.emissionsPerServingLabel.text = "Emissions/serving: \(food.carbonEmissionsGramsPerServing)"
        
        return cell
    }


}
