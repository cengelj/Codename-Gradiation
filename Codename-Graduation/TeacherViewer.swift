//
//  TeacherViewer.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 1/9/17.
//  Copyright © 2017 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class TeacherViewer: UIViewController{
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var compLabel: UILabel!
	@IBOutlet weak var diffLabel: UILabel!
	@IBOutlet weak var strictLabel: UILabel!
	@IBOutlet weak var curveLabel: UILabel!
	var teacher: Teacher!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		nameLabel.text = teacher.name
		strictLabel.text = "Strictness: \(Int(teacher.strict))/10"
		if !teacher.compHW{
			compLabel.text = "Doesn't Grade On Completion"
		}
		if !teacher.testDiff{
			diffLabel.text = "Tests Aren't Difficult"
		}
		if !teacher.testCurve{
			curveLabel.text = "Doesn't Curve Tests"
		}
	}
	func showTeacher(teacher: Teacher){
		self.teacher = teacher
		
	}
	
}
