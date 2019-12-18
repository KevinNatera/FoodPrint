//
//  SearchFoodTVCell.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SearchFoodTVCell: UITableViewCell {
    
    //MARK: - Properties
    lazy var foodNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        label.text = "foodName"
        label.textAlignment = .center
        return label
    }()
    
    lazy var caloriesPerServingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.frame = CGRect(x: 200, y: 0, width: 250, height: 75)
        label.text = "caloriesPerServing"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emissionsPerServingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.frame = CGRect(x: 200, y: 75, width: 250, height: 75)
        label.text = "emissionsPerServing"
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func addSubViews() {
        contentView.addSubview(foodNameLabel)
        contentView.addSubview(caloriesPerServingLabel)
        contentView.addSubview(emissionsPerServingLabel)
    }
  
}
