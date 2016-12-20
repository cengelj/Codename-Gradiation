//
//  SearchController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/1/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit
import WebKit

class SearchController: UIViewController, UISearchResultsUpdating, UITableViewDelegate{
	var selectedID = ""
	@IBOutlet var tableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let searchController = UISearchController(searchResultsController: nil)
		searchController.searchResultsUpdater = self
		searchController.dimsBackgroundDuringPresentation = false
		definesPresentationContext = true
		tableView.tableHeaderView = searchController.searchBar
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	func updateSearchResults(for searchController: UISearchController){
		print("\(searchController.searchBar.text)")
		//manage the searching
	}
	func tableView(_: UITableView, didSelectRowAt: IndexPath){
		let searchResultsController = SearchResultsController()
		var arr = Array(UserDefaults.standard.array(forKey: "collegeArray")!)
		var name = arr[didSelectRowAt.row] as! String
		var dict = UserDefaults.standard.dictionary(forKey: "collegeDictionary")
		selectedID = dict?[name] as! String
		
		searchResultsController.ID = selectedID
		self.navigationController?.pushViewController(searchResultsController, animated: true)

		print("ID: \(selectedID)")
	}
}
