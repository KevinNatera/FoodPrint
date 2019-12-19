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
        //searchbar.frame = CGRect(x: 0, y: 100, width: 420, height: 40)
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
extension SearchFoodVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        //searchCode
    }
}


extension SearchFoodVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Food.foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "search") as! SearchFoodTVCell
        let foods = Food.foodList[indexPath.row]
        
        cell.foodNameLabel.text = foods.name
        cell.caloriesPerServingLabel.text = "\(foods.calories)"
        cell.emissionsPerServingLabel.text = "\(foods.carbonEmissionsKgPerServing)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodDetailVC = FoodDetailsVC()
        foodDetailVC.foodsDetail = Food.foodList[indexPath.row];
        self.navigationController?.pushViewController(foodDetailVC, animated: true)
        
    }
}
