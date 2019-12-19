//
//  FoodDetailsVC.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class FoodDetailsVC: UIViewController {
    
    //MARK: - Properties
    
    lazy var imageOutlet: UIImageView = {
        let image = UIImageView()
        //image.frame = CGRect(x: 80, y: 100, width: 250, height: 250)
        image.backgroundColor = .blue
        return image
    }()
    
    lazy var foodNameLabel: UILabel = {
        let label = UILabel()
        //label.frame = CGRect(x: 0, y: 425, width: 420, height: 40)
        label.textAlignment = .center
        label.text = "foodname"
        label.backgroundColor = .red
        return label
    }()
    
    lazy var caloriesPerServingLabel: UILabel = {
        let label = UILabel()
        //label.frame = CGRect(x: 0, y: 500, width: 420, height: 40)
        label.text = "caloriesperserving"
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var servingsLabel: UILabel = {
        let label = UILabel()
        //label.frame = CGRect(x: 0, y: 575, width: 170, height: 40)
        label.text = "Number of Servings: "
        label.textAlignment = .left
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var servingsTextField: UITextField = {
        let textField = UITextField()
        //textField.frame = CGRect(x: 175, y: 575, width: 250, height: 40)
        textField.placeholder = "Enter amount in grams"
        textField.delegate = self
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var totalCaloriesLabel: UILabel = {
        let label = UILabel()
        //label.frame = CGRect(x: 0, y: 650, width: 420, height: 40)
        label.textAlignment = .center
        label.text = "totalCalories"
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var totalEmissionsLabel: UILabel = {
          let label = UILabel()
          //label.frame = CGRect(x: 0, y: 725, width: 420, height: 40)
          label.textAlignment = .center
          label.text = "totalEmissions"
          label.backgroundColor = .blue
          return label
      }()

    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        //button.frame = CGRect(x: 180, y: 800, width: 50, height: 50)
        return button
    }()
    
    var foodsDetail: Food!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setText()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstraints()
    }
    
    @objc func addButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Private Methods
    
    private func setText(){
        foodNameLabel.text = foodsDetail.name
        caloriesPerServingLabel.text = "\(foodsDetail.calories)"
        servingsLabel.text = "\(foodsDetail.servings)"
        totalCaloriesLabel.text = "\(foodsDetail.calories)"
        totalEmissionsLabel.text = "\(foodsDetail.carbonEmissionsGramsPerServing)"
    }
    
    private func addSubViews() {
        view.backgroundColor = .white
        view.addSubview(imageOutlet)
        view.addSubview(foodNameLabel)
        view.addSubview(caloriesPerServingLabel)
        view.addSubview(servingsLabel)
        view.addSubview(servingsTextField)
        view.addSubview(totalCaloriesLabel)
        view.addSubview(totalEmissionsLabel)
        view.addSubview(addButton)
    }
    
    private func setupConstraints(){
        let stackView = UIStackView(arrangedSubviews: [foodNameLabel,caloriesPerServingLabel,servingsTextField ,servingsLabel,totalCaloriesLabel,totalEmissionsLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        imageOutlet.translatesAutoresizingMaskIntoConstraints = false
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        caloriesPerServingLabel.translatesAutoresizingMaskIntoConstraints = false
        servingsLabel.translatesAutoresizingMaskIntoConstraints = false
        servingsTextField.translatesAutoresizingMaskIntoConstraints = false
        totalCaloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        totalEmissionsLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageOutlet.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageOutlet.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageOutlet.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageOutlet.heightAnchor.constraint(equalToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: imageOutlet.bottomAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            
            addButton.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
    }
}

//MARK: - Extensions

extension FoodDetailsVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        //update UI Code
    }
}
