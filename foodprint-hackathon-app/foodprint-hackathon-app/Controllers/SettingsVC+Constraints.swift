//
//  SettingsVC+Constraints.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension SettingsVC {
    
    //MARK: - UI Constraints
    
    func addSubviews() {
        view.addSubview(welcomeLabel)
        view.addSubview(inputStackView)
        view.addSubview(goalStackView)
    }
    
    func addConstraints() {
        setWelcomeLabelConstraints()
        setInputStackViewConstraints()
        setGoalStackViewConstraints()
    }
    
    private func setWelcomeLabelConstraints() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func setInputStackViewConstraints() {
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            inputStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            inputStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            inputStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGxuxide.heightAnchor, multiplier: 0.5),
            
            nameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            heightTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            weightTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            ageTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6)
            
        ])
        
    }
    
    private func setGoalStackViewConstraints() {
        goalStackView.translatesAutoresizingMaskIntoConstraints = false
        calorieSlider.translatesAutoresizingMaskIntoConstraints = false
        emissionsSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goalStackView.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 20),
            goalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goalStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            goalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            calorieSlider.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            emissionsSlider.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
        ])
    }
}
