//
//  HomescreenVC.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class HomescreenVC: UIViewController {
    //TODO: Show alert to pop to SettingsVC if info is not complete
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi name!"
        label.textAlignment = .center
        return label
    }()
    
    lazy var calorieGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Calories per day: "
        label.textAlignment = .center
        return label
    }()
    
    lazy var emissionsGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Emissions per day: "
        label.textAlignment = .center
        return label
    }()
    
    lazy var userInfoStackView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, calorieGoalLabel, emissionsGoalLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.text = "Daily Progress"
        return label
    }()
    
    lazy var calorieProgressView: CircularProgressView = {
        let progressView = CircularProgressView()
        progressView.backgroundColor = .blue
        return progressView
    }()
    
    lazy var emissionsProgressView: CircularProgressView = {
        let progressView = CircularProgressView()
        progressView.backgroundColor = .red
        return progressView
    }()
    
    lazy var progressStackView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [progressLabel, calorieProgressView, emissionsProgressView])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var addFoodButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Food", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(addFoodButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var currentUser: AppUser? {
        didSet {
            calorieGoal = currentUser?.caloriesPerDayGoal
            emissionsGoal = currentUser?.avgEmissionPerDay
            
        }
    }
    
    var calorieGoal: Int? {
        didSet {
            calorieGoalLabel.text = "Calories Goal: \(calorieGoal ?? 0) cal/day"
        }
    }
    var emissionsGoal: Int? {
        didSet {
            emissionsGoalLabel.text = "CO2 Emissions Goal: \(emissionsGoal ?? 0) g/day"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        addSubviews()
        addConstraints()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUserData()
        
    }
    
    @objc func addFoodButtonPressed() {
        self.navigationController?.pushViewController(SearchFoodVC(), animated: true)
    }

        
    private func loadUserData() {
        do {
            currentUser = try AppUserPersistenceHelper.manager.getUser().last
        } catch {
            print(error)
        }
        
        if currentUser != nil {
            updateUserInfo()
        } else {
            //TODO: Show alert and pop back to SettingsVC
        }
    }

    private func updateUserInfo() {
        welcomeLabel.text = "Hi \(currentUser!.name)!"
        updateCalorieProgress()
        updateEmissionsProgress()
    }

    private func updateCalorieProgress() {
        if let currentCalories = currentUser!.currentCalories,
            let calorieGoal = calorieGoal {
        
            let calorieProgress:Double = Double(Double(currentCalories) / Double(calorieGoal))
            calorieProgressView.progressAnimation(progress: Double(calorieProgress), duration: 2)
            
        } else {
            calorieProgressView.progressAnimation(progress: 0, duration: 0)
        }
    }
    
    private func updateEmissionsProgress() {
        if let currentEmissions = currentUser!.currentEmissions,
            let emissionsGoal = emissionsGoal {
        
            let emissionsProgress:Double = Double(Double(currentEmissions) / Double(emissionsGoal))
            calorieProgressView.progressAnimation(progress: Double(emissionsProgress), duration: 2)
            
        } else {
            calorieProgressView.progressAnimation(progress: 0, duration: 0)
        }

    }
    
}
