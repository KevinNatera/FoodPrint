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
    //TODO: Style objects (text, slider color, button color, spacings)
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter name:"
        label.textAlignment = .left
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter height (ft):"
        label.textAlignment = .left
        return label
    }()
    
    //TODO: Rework as picker rather than textField
    lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "i.e. 5.5"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter weight (lbs):"
        label.textAlignment = .left
        return label
    }()
    
    //TODO: Rework as picker rather than textField
    lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "i.e. 120.2"
        textField.borderStyle = .roundedRect
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
       let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField, heightLabel, heightTextField, weightLabel, weightTextField, submitButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var calorieGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Calories/day Goal: \(calorieGoal ?? 0)"
        return label
    }()
    
    lazy var calorieSlider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    lazy var emissionsGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Emissions/day Goal: \(emissionsGoal ?? 0)"
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
    var currentUser: AppUser? {
        didSet {
            calorieGoal = currentUser?.caloriesPerDayGoal
            emissionsGoal = currentUser?.avgEmissionPerDay
        }
    }
    
    var calorieGoal: Int?
    var emissionsGoal: Int?
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    
        addSubviews()
        addConstraints()
    
        configureSliders()
        
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
            updateAppInfoForUser()
            //TODO: Change button text to "Update Info"
            showGoalStackView()
        }
    }
    
    private func updateAppInfoForUser() {
        welcomeLabel.text = "Welcome \(currentUser!.name)!"
        
        nameLabel.text = "Edit name:"
        heightLabel.text = "Edit height:"
        weightLabel.text = "Edit weight:"
        
        nameTextField.placeholder = "\(currentUser!.name)"
        heightTextField.placeholder = "\(currentUser!.height) ft"
        weightTextField.placeholder = "\(currentUser!.weight) lbs"
        
        calorieGoal = currentUser?.caloriesPerDayGoal
        emissionsGoal = currentUser?.avgEmissionPerDay
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
    
    private func configureSliders() {
        //TODO: determine min and max values for sliders based on min and max calories
        calorieSlider.value = 0.5
        emissionsSlider.value = 0.5
    
    }
}

