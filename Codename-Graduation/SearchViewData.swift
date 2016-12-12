//
//  SearchViewData.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/8/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class SearchViewData: NSObject, UITableViewDataSource{
	var data: [String]?
	
	override init(){
		super.init()
		data = ["one", "two", "three"]
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tabRet = UITableViewCell()
		tabRet.backgroundColor = UIColor.darkGray
		tabRet.textLabel!.font = UIFont(name: "helvetica neue", size: 20)
		tabRet.textLabel?.textAlignment = .center
		tabRet.textLabel?.text = data?[indexPath.row]
		
		return tabRet
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data!.count
	}
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
}
