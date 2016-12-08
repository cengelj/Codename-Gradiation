//
//  SearchController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/1/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class SearchController: UISearchController{
	var searchType: String?
    var change = "one"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	//override func prepare(for seque: UIStoryboardSegue, sender: Any?){
		//if let SearchController = seque.destination as? SearchController {
			//SearchController.searchType = searchType
		//}
	//}
	
}
