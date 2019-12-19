//
//  HomescreenVC+Constraints.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension HomescreenVC {
    //MARK: - UI Constraints
    func addSubviews() {
        view.addSubview(userInfoStackView)
        view.addSubview(progressStackView)
        view.addSubview(addFoodButton)
    }
    
    func addConstraints() {
        setUserInfoStackViewConstraints()
        setProgressStackViewConstraints()
        setAddFoodButtonConstraints()
    }
    
    private func setUserInfoStackViewConstraints() {
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        calorieGoalLabel.translatesAutoresizingMaskIntoConstraints = false
        emissionsGoalLabel.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            userInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            userInfoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            userInfoStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
            userInfoStackView.centerXAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            calorieGoalLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emissionsGoalLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
    private func setProgressStackViewConstraints() {
        progressStackView.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        calorieProgressView.translatesAutoresizingMaskIntoConstraints = false
        emissionsProgressView.translatesAutoresizingMaskIntoConstraints = false
     
        
        NSLayoutConstraint.activate([
            progressStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            progressStackView.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: 30),
            progressStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
            progressStackView.centerXAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            progressLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressLabel.bottomAnchor.constraint(equalTo: calorieProgressView.topAnchor, constant: -70),
            
            calorieProgressView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -70),
            calorieProgressView.heightAnchor.constraint(equalTo: progressStackView.heightAnchor, multiplier: 0.2),
            calorieProgressView.widthAnchor.constraint(equalTo: calorieProgressView.heightAnchor),
            calorieProgressView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 80),
            
            emissionsProgressView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 115),
            emissionsProgressView.heightAnchor.constraint(equalTo: progressStackView.heightAnchor, multiplier: 0.2),
            emissionsProgressView.widthAnchor.constraint(equalTo: emissionsProgressView.heightAnchor),
            emissionsProgressView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 80)
            
        ])
    }
    
    private func setAddFoodButtonConstraints() {
        addFoodButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addFoodButton.topAnchor.constraint(equalTo: progressStackView.bottomAnchor, constant: 20),
            addFoodButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addFoodButton.widthAnchor.constraint(equalToConstant: 100),
            addFoodButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
