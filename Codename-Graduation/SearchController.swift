//
//  SearchController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/1/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit
import WebKit

class SearchController: UIViewController, UITableViewDelegate, UISearchBarDelegate{
	var selectedID = ""
	@IBOutlet var tableView: UITableView!
	var searchDataSource = SearchViewData()
	let searchController = UISearchController(searchResultsController: nil)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.dataSource = searchDataSource
		searchController.searchBar.delegate = self
		searchController.dimsBackgroundDuringPresentation = false
		definesPresentationContext = true
		tableView.tableHeaderView = searchController.searchBar
		let backgroundImage = UIImage(named: "bg1.png")
		let imageView = UIImageView(image: backgroundImage)
		self.tableView.backgroundView = imageView
		tableView.tableFooterView = UIView(frame: CGRectZero)
		imageView.contentMode = .ScaleAspectFit
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
		searchDataSource.filter(searchText: searchBar.text!, tableView: tableView)
	}
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
		searchDataSource.resetSearch(tableView: tableView)
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
	
	override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		cell.backgroundColor = .clearColor()
	}
	
	
}
