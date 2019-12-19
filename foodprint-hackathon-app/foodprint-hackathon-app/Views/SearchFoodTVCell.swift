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
        label.backgroundColor = .lightGray
        //label.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        label.text = "foodName"
        label.textAlignment = .center
        return label
    }()
    
    lazy var caloriesPerServingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        //label.frame = CGRect(x: 200, y: 0, width: 250, height: 75)
        label.text = "caloriesPerServing"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emissionsPerServingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        //label.frame = CGRect(x: 200, y: 75, width: 250, height: 75)
        label.text = "emissionsPerServing"
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setupConstraints()
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
    
    private func setupConstraints(){
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        caloriesPerServingLabel.translatesAutoresizingMaskIntoConstraints = false
        emissionsPerServingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            foodNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodNameLabel.heightAnchor.constraint(equalToConstant: 150),
            foodNameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            caloriesPerServingLabel.leadingAnchor.constraint(equalTo: foodNameLabel.trailingAnchor),
            caloriesPerServingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            caloriesPerServingLabel.heightAnchor.constraint(equalToConstant: 75),
            
            emissionsPerServingLabel.topAnchor.constraint(equalTo: caloriesPerServingLabel.bottomAnchor),
            emissionsPerServingLabel.leadingAnchor.constraint(equalTo: foodNameLabel.trailingAnchor),
            emissionsPerServingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            emissionsPerServingLabel.heightAnchor.constraint(equalToConstant: 75)
            
        ])
    }
  
}
