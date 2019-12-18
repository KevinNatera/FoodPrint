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
    
        NSLayoutConstraint.activate([
            userInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            userInfoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            userInfoStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            userInfoStackView.centerXAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
    private func setProgressStackViewConstraints() {
        progressStackView.translatesAutoresizingMaskIntoConstraints = false
     
        NSLayoutConstraint.activate([
            progressStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            progressStackView.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: 10),
            progressStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            progressStackView.centerXAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setAddFoodButtonConstraints() {
        addFoodButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addFoodButton.topAnchor.constraint(equalTo: progressStackView.bottomAnchor, constant: 20),
            addFoodButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addFoodButton.widthAnchor.constraint(equalToConstant: 100),
            addFoodButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30)
        ])
    }
}
