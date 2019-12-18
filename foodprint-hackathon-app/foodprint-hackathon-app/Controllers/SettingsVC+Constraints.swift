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
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func setInputStackViewConstraints() {
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            inputStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            inputStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
    }
    
    private func setGoalStackViewConstraints() {
        goalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goalStackView.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 20),
            goalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goalStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            goalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
    }
}
