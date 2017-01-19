//
//  TeacherController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/8/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class TeacherController: UIViewController, UITableViewDataSource, UITableViewDelegate{
	var teachers: [Teacher] = []
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let teach = UserDefaults.standard.object(forKey: "teachers") as? NSData{
			self.teachers = (NSKeyedUnarchiver.unarchiveObject(with: teach as Data) as? [Teacher])!
		}
		else{
			teachers = []
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tabRet = UITableViewCell()
		tabRet.textLabel!.font = UIFont(name: "helvetica neue", size: 15)
		tabRet.textLabel?.textAlignment = .left
		tabRet.textLabel?.text = teachers[indexPath.row].name
		
		return tabRet
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return teachers.count
	}
	func tableView(_: UITableView, didSelectRowAt: IndexPath){		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let destination = storyboard.instantiateViewController(withIdentifier: "TeacherViewer") as! TeacherViewer
		destination.showTeacher(teacher: teachers[didSelectRowAt.row])
		navigationController?.pushViewController(destination, animated: true)
	}
	func addTeacher(name: String, compHW: Bool, testDiff: Bool, testCurve: Bool, strict: Float){
		var add = Teacher(name: name, compHW: compHW, testDiff: testDiff, testCurve: testCurve, strict: strict)
		teachers.append(add)
		let encodedData = NSKeyedArchiver.archivedData(withRootObject: teachers)
		UserDefaults.standard.set(encodedData, forKey: "teachers")
		UserDefaults.standard.synchronize()
		tableView.reloadData()
	}
	override func prepare(for segue: UIStoryboardSegue, sender: Any?){
		var destination = segue.destination as! AddTeacher
		destination.teacherController = self
	}
}
