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
        image.frame = CGRect(x: 80, y: 100, width: 250, height: 250)
        image.backgroundColor = .blue
        return image
    }()
    
    lazy var foodNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 425, width: 420, height: 40)
        label.textAlignment = .center
        label.text = "foodname"
        label.backgroundColor = .red
        return label
    }()
    
    lazy var caloriesPerServingLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 500, width: 420, height: 40)
        label.text = "caloriesperserving"
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var servingsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 575, width: 170, height: 40)
        label.text = "Number of Servings: "
        label.textAlignment = .left
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var servingsTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 175, y: 575, width: 250, height: 40)
        textField.delegate = self
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var totalCaloriesLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 650, width: 420, height: 40)
        label.textAlignment = .center
        label.text = "totalCalories"
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var totalEmissionsLabel: UILabel = {
          let label = UILabel()
          label.frame = CGRect(x: 0, y: 725, width: 420, height: 40)
          label.textAlignment = .center
          label.text = "totalEmissions"
          label.backgroundColor = .blue
          return label
      }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 180, y: 800, width: 50, height: 50)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    @objc func addButtonPressed() {
        print("boii")
    }
    
//MARK: - Private Methods
    
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
    

}

//MARK: - Extensions

extension FoodDetailsVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        //update UI Code
    }
}
