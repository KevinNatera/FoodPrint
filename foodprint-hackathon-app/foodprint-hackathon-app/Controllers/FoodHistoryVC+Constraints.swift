//
//  File.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension FoodHistoryVC {
    //MARK: - UI Constraints
    func addSubViews() {
        view.addSubview(historyTableView)
    }

    func addConstraints() {
        historyTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        historyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        historyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        historyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        historyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        ])
    }
}
