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
        view.addSubview(inputStackView)
        view.addSubview(goalStackView)
    }
    
    func addConstraints() {
        setInputStackViewConstraints()
        setGoalStackViewConstraints()
    }
    
    private func setInputStackViewConstraints() {
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            inputStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            inputStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
    }
    
    private func setGoalStackViewConstraints() {
        goalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            goalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goalStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            goalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}
