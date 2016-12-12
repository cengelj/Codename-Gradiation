//
//  GradeController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/8/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class GradeController: UIViewController{
	
	@IBOutlet weak var percentFinalGrade: UITextField!
	@IBOutlet weak var percentWantedText: UITextField!
	@IBOutlet weak var percentWantedSlide: UISlider!
	@IBOutlet weak var finalTextOutput: UILabel!
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	@IBAction func gradeWantedEntered(_ sender: UITextField) {
		let numText = Int(sender.text!)
		let text = Float(numText!)
		percentWantedSlide.setValue(text, animated: false)
	}
	
	@IBAction func calculateNeeded(_ sender: UIButton) {
		
	}
	
	@IBAction func setSlideValue(_ sender: UISlider) {
		sender.setValue(round(sender.value), animated: false)
		percentWantedText.text = "\(percentWantedSlide.value)%"
	}
}
