//
//  ViewController.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    //MARK: - UI Objects
    //TODO: Refactor later to change input method (i.e. picker?)
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        return textField
    }()
    
    lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Height"
        return textField
    }()
    
    lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Weight"
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        return button
    }()
    
    lazy var inputStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [nameTextField, heightTextField, weightTextField, submitButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var calorieGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Calorie Goal"
        return label
    }()
    
    lazy var calorieSlider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    lazy var emissionsGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Emissions Goal"
        return label
    }()
    
    lazy var emissionsSlider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    lazy var goalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [calorieGoalLabel, calorieSlider, emissionsGoalLabel, emissionsSlider])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        addSubviews()
        addConstraints()
    }


}

