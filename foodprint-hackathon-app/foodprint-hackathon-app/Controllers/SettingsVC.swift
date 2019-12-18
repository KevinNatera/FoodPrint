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
        return textField
    }()
    
    lazy var heightTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    lazy var weightTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var inputStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [nameTextField, heightTextField, weightTextField, submitButton])
        return stackView
    }()
    
    lazy var calorieGoalLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var calorieSlider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    lazy var emissionsGoalLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var emissionsSlider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    lazy var goalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [calorieGoalLabel, calorieSlider, emissionsGoalLabel, emissionsSlider])
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
    }


}

