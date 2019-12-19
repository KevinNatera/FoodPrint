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
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter age:"
        label.textAlignment = .left
        return label
    }()
    
    lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "i.e. 28"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var sexLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter sex:"
        label.textAlignment = .left
        return label
    }()
    
    lazy var sexSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male","Female"])
        return segmentedControl
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var inputStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField, heightLabel, heightTextField, weightLabel, weightTextField, ageLabel, ageTextField, sexLabel, sexSegmentedControl, submitButton])
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
        slider.tag = 0
        slider.addTarget(self, action: #selector(sliderDidChange(_:)), for: .valueChanged)
        return slider
    }()
    
    lazy var emissionsGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Emissions/day Goal: \(emissionsGoal ?? 0)"
        return label
    }()
    
    lazy var emissionsSlider: UISlider = {
        let slider = UISlider()
        slider.tag = 1
        slider.addTarget(self, action: #selector(sliderDidChange(_:)), for: .valueChanged)
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
    
    var calorieGoal: Int? {
        didSet {
            calorieGoalLabel.text = "Calories Goal: \(calorieGoal ?? 0) cal/day"
            // Update currentUser.caloriesPerDayGoal in persistence
        }
    }
    var emissionsGoal: Int? {
        didSet {
            emissionsGoalLabel.text = "CO2 Emissions Goal: \(emissionsGoal ?? 0) g/day"
            // Update currentUser.emissionsPerDayGoal in persistence - NEED TO MAKE THIS VARIABLE  IN APPUSERMODEL
            
        }
    }
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    
        addSubviews()
        addConstraints()
    
        
        configureSegmentedControl()
        
        hideGoalStackView()
        loadCurrentUser()
    }
    
    //MARK: - Obj-C Functions
    @objc func submitButtonPressed() {
        validateFields()
    }
    
    @objc func sliderDidChange(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            calorieGoal = Int(sender.value)
        case 1:
            emissionsGoal = Int(sender.value)
        default:
            print("No such thing")
            
        }
    }
    
    //MARK: - Private Methods
    private func configureSegmentedControl() {
        sexSegmentedControl.selectedSegmentIndex = 0
    }
    
    private func hideGoalStackView() {
        goalStackView.isHidden = true
    }
    
    private func loadCurrentUser() {
        
        do {
            //TODO: Do this for specific userID
            currentUser = try AppUserPersistenceHelper.manager.getUser().last
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
        ageLabel.text = "Edit age:"
        sexLabel.text = "Edit sex:"
        
        nameTextField.placeholder = "\(currentUser!.name)"
        heightTextField.placeholder = "\(currentUser!.height) ft"
        weightTextField.placeholder = "\(currentUser!.weight) lbs"
        ageTextField.placeholder = "\(currentUser!.age)"
        
        switch currentUser!.sex {
        case "Male":
            sexSegmentedControl.selectedSegmentIndex = 0
        case "Female":
            sexSegmentedControl.selectedSegmentIndex = 1
        default:
            sexSegmentedControl.selectedSegmentIndex = 0
        }
        
        calorieGoal = currentUser?.caloriesPerDayGoal
        emissionsGoal = currentUser?.avgEmissionPerDay
    }
    
    private func showGoalStackView() {
        configureSliders()
        goalStackView.isHidden = false
    }
    
    private func validateFields() {
        //TODO: Add if currentUser exists, REPLACE input instead of creating new user
        guard let name = nameTextField.text,
            let heightStr = heightTextField.text,
            let weightStr = weightTextField.text,
            let ageStr = ageTextField.text
        else { showAlert(message: "All entries must be complete!"); return }

        guard let height = Double(heightStr),
            let weight = Double(weightStr),
            let age = Int(ageStr)
            else { showAlert(message: "Double check number entries!"); return }
        
        var sex = "Male"
        
        switch sexSegmentedControl.selectedSegmentIndex {
        case 0:
            sex = "Male"
        case 1:
            sex = "Female"
        default:
            sex = "Male"
        }
        
        createNewUser(name: name, height: height, weight: weight, age: age, sex: sex)
    }
    
    private func createNewUser(name: String, height: Double, weight: Double, age: Int, sex: String) {
        let newUser = AppUser(name: name, height: height, weight: weight, age: age, sex: sex)
        
        do {
            try AppUserPersistenceHelper.manager.saveUser(newUser: newUser)
            showGoalStackView()
            print("User saved")
    
        } catch {
            print(error)
            //Show Alert
        }
        
        //Pass currentUser to homescreen?
    }
    
    private func showAlert(message: String) {
        //TODO: Add alert
        print("Alert:\(message)")
    }
    
    private func configureSliders() {
        do {
            currentUser = try AppUserPersistenceHelper.manager.getUser().last
        } catch {
            print(error)
        }
        
        let caloriesPerDayGoal = currentUser?.caloriesPerDayGoal ?? 2000
        let avgEmissionsPerDay = currentUser?.avgEmissionPerDay ?? 2268
        
        calorieGoalLabel.text = "Calories Goal: \(caloriesPerDayGoal) cal/day"
        emissionsGoalLabel.text = "CO2 Emissions Goal: \(avgEmissionsPerDay) g/day"
        
        
        let minCalPerDay: Float = 1000
        let maxCalPerDay: Float = 3500
        
        calorieSlider.minimumValue = minCalPerDay
        calorieSlider.maximumValue = maxCalPerDay
        //TODO: Figure out why initial value isn't set
        calorieSlider.value = Float(caloriesPerDayGoal)
        
        emissionsSlider.minimumValue = 0
        emissionsSlider.maximumValue = Float(avgEmissionsPerDay*2)
        emissionsSlider.value = Float(avgEmissionsPerDay)
    
    }
}

