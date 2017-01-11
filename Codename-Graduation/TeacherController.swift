//
//  TeacherController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/8/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class TeacherController: UIViewController, UITableViewDataSource, UITableViewDelegate{
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredData.count
	}
}
