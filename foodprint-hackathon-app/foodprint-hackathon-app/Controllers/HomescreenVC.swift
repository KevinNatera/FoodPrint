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
    

    var currentUser = AppUser(name: "boi", height: 3.5, weight: 90, age: 28, sex: "Female")

    
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
        label.text = "Progress"
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
        button.addTarget(self, action: #selector(addFoodButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func addFoodButtonPressed() {
        self.navigationController?.pushViewController(SearchFoodVC(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        addSubviews()
        addConstraints()
        loadData()
    
    }
    

        
    



    private func loadData() {
        welcomeLabel.text = "Hi \(currentUser.name) !"
        calorieProgressView.progressAnimation(progress: 0.4, duration: 2)
    }
    
    
}
