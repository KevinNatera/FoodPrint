//
//  SearchFoodVC.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SearchFoodVC: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.delegate = self
        searchbar.frame = CGRect(x: 0, y: 100, width: 420, height: 40)
        return searchbar
    }()
    
    lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchFoodTVCell.self, forCellReuseIdentifier: "search")
        tableView.frame = CGRect(x: 0, y: 140, width: 420, height: 800)
        tableView.rowHeight = 150
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    //MARK: - Private Methods
    
    private func addSubViews() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(searchTableView)
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "search") as! SearchFoodTVCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //segue
        
    }
}
