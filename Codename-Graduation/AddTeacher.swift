//
//  AddTeacher.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 1/9/17.
//  Copyright © 2017 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class AddTeacher: UIViewController{
	@IBOutlet weak var nameText: UITextField!
	@IBOutlet weak var completionHW: UISwitch!
	@IBOutlet weak var testDiff: UISwitch!
	@IBOutlet weak var testCurve: UISwitch!
	@IBOutlet weak var strictness: UISlider!
	var teacherController: TeacherController!

	
	@IBAction func doneClicked(_ sender: UIButton) {
		teacherController.addTeacher(name: nameText.text!, compHW: completionHW.isOn, testDiff: testDiff.isOn, testCurve: testCurve.isOn, strict: strictness.value)
		self.dismiss(animated: true, completion: nil)
		//self.navigationController?.pushViewController(teacherController, animated: true)
	}
}
