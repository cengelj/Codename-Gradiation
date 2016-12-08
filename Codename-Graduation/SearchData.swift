//
//  SearchData.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/7/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class SearchData{
	var searchable = ["one", "two", "three", "four"]
	
	func getResults() -> [String]{
		return searchable
		//Temporary, later replace with a parameter and actual searching.
	}
}
