//
//  GradeController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/8/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class GradeController: UIViewController{
	
	@IBOutlet weak var currentGrade: UITextField!
	@IBOutlet weak var percentFinalGrade: UITextField!
	@IBOutlet weak var percentWantedText: UITextField!
	@IBOutlet weak var percentWantedSlide: UISlider!
	@IBOutlet weak var finalTextOutput: UILabel!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		finalTextOutput.text = ""
        let background = UIImage(named: "bg2.png")
        self.view.backgroundColor = UIColor(patternImage: background!)
	}
	@IBAction func gradeWantedEntered(_ sender: UITextField) {
		var str = sender.text!
		var temp = str.remove(at: str.index(str.endIndex, offsetBy: -1))
		if temp != "%"{
			str.insert(temp, at: str.endIndex)
		}
		
		let numText = Int(str)
		let text = Float(numText!)
		percentWantedSlide.setValue(text, animated: false)
		str.insert("%", at: str.endIndex)
		sender.text = str
	}
	
	@IBAction func calculateNeeded(_ sender: UIButton) {
		var one = Int(percentWantedSlide.value)*100
		var two = ((100-Int(percentFinalGrade.text!)!)*Int(currentGrade.text!)!)
		finalTextOutput.text = "\((one-two)/Int(percentFinalGrade.text!)!)%"
	}
	
	@IBAction func setSlideValue(_ sender: UISlider) {
		sender.setValue(round(sender.value), animated: false)
		percentWantedText.text = "\(percentWantedSlide.value)%"
	}
}
