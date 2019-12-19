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
    //TODO: Style objects (text, slider color, button color, spacing)s
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        textField.delegate = self
        return textField
    }()
    
    //TODO: Rework as picker rather than textField
    lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Height"
        textField.delegate = self
        return textField
    }()
    
    //TODO: Rework as picker rather than textField
    lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Weight"
        textField.delegate = self
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
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
    
    //MARK: - Internal Properties
    var currentUser: AppUser?
    
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        addSubviews()
        addConstraints()
        
        hideGoalStackView()
        loadCurrentUser()
    }
    
    //MARK: - Obj-C Functions
    @objc func submitButtonPressed() {
        validateFields()
    }
    
    //MARK: - Private Methods
    private func hideGoalStackView() {
        goalStackView.isHidden = true
    }
    
    private func loadCurrentUser() {
        
        do {
            //TODO: Do this for specific userID
            currentUser = try AppUserPersistenceHelper.manager.getUser().first
        } catch {
            print(error)
        }
        
        if currentUser != nil {
            nameTextField.placeholder = currentUser!.name
            heightTextField.placeholder = "\(currentUser!.height) ft"
            weightTextField.placeholder = "\(currentUser!.weight) lbs"
            
            //TODO: Change button text to "Update Info"
            showGoalStackView()
        }
    }
    
    private func showGoalStackView() {
        goalStackView.isHidden = false
    }
    
    private func validateFields() {
        //TODO: Add if currentUser exists, REPLACE input instead of creating new user
        guard let name = nameTextField.text,
            let heightStr = heightTextField.text,
            let weightStr = weightTextField.text else { showAlert(message: "All entries must be complete!"); return }

        guard let height = Double(heightStr),
            let weight = Double(weightStr) else { showAlert(message: "Double check height and weight entries!"); return }
        
        createNewUser(name: name, height: height, weight: weight)
    }
    
    private func createNewUser(name: String, height: Double, weight: Double) {
        let newUser = AppUser(name: name, height: height, weight: weight)
        
        do {
            try AppUserPersistenceHelper.manager.saveUser(newUser: newUser)
            print("User saved")
        } catch {
            print(error)
        }
        
        //Pass currentUser to homescreen?
    }
    
    private func showAlert(message: String) {
        //TODO: Add alert
        print("Alert:\(message)")
    }
}

