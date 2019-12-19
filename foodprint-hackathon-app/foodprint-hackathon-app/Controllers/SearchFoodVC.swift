//
//  SearchFoodVC.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SearchFoodVC: UIViewController {
    
    
    //MARK: - Properties
    lazy var searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.delegate = self
        searchbar.showsBookmarkButton = true
        searchbar.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: UISearchBar.Icon.bookmark, state: .normal)
        return searchbar
    }()
    
    lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchFoodTVCell.self, forCellReuseIdentifier: "search")
        //tableView.frame = CGRect(x: 0, y: 140, width: 420, height: 800)
        tableView.rowHeight = 150
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var foodSearchVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: SearchFoodVC())
        return navController
    }()
    
    var searchString: String? = nil {
        didSet{
            self.searchTableView.reloadData()
        }
    }
    
    var allFood = Food.foodList
    var foods: [Food] {
        get {
            guard let searchString = searchString else{
                return Food.foodList
            }
            guard searchString != "" else {
                
                return Food.foodList
            }
            switch searchString{
                
            case "Meat":
                let results =  Food.foodList.filter{$0.category.lowercased().contains(searchString)}
                if results.count == 0 {
                    searchBar.resignFirstResponder()
                    return []
                } else {
                    return Food.foodList.filter{$0.category.lowercased().contains(searchString)}
                }
                
            case "Vegetable":
                let results =  Food.foodList.filter{$0.category.lowercased().contains(searchString)}
                if results.count == 0 {
                    searchBar.resignFirstResponder()
                    return []
                } else {
                    
                    return Food.foodList.filter{$0.name.lowercased().contains(searchString)}
                }
                
            case "Dairy":
                let results =  Food.foodList.filter{$0.category.lowercased().contains(searchString)}
                if results.count == 0 {
                    searchBar.resignFirstResponder()
                    return []
                } else {
                    return Food.foodList.filter{$0.category.lowercased().contains(searchString)}
                }
                
            case "Bread":
                let results =  Food.foodList.filter{$0.category.lowercased().contains(searchString)}
                if results.count == 0 {
                    searchBar.resignFirstResponder()
                    return []
                } else {
                    return Food.foodList.filter{$0.category.lowercased().contains(searchString)}
                }
                
            default:
                return allFood
            }
        }
        set {
            self.foods = allFood
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstraints()
    }
    
    //MARK: - Private Methods
    
    private func addSubViews() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(searchTableView)
    }
    
    
    private func setupConstraints(){
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            searchTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            
        ])
    }
    
    
    
}



//MARK: - Extensions
extension SearchFoodVC: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchString = searchBar.text
    }
    
}



extension SearchFoodVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "search") as! SearchFoodTVCell
        let theFoods = foods[indexPath.row]
        
        cell.foodNameLabel.text = theFoods.name
        cell.caloriesPerServingLabel.text = "\(theFoods.calories)"
        cell.emissionsPerServingLabel.text = "\(theFoods.carbonEmissionsGramsPerServing)"


        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodDetailVC = FoodDetailsVC()
        foodDetailVC.foodsDetail = foods[indexPath.row];
        self.navigationController?.pushViewController(foodDetailVC, animated: true)
        
    }
}
