//
//  ViewController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/1/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class ViewController: UIViewController{
	override func viewDidLoad() {
		super.viewDidLoad()
        let background = UIImage(named: "bg3.png")
        self.view.backgroundColor = UIColor(patternImage: background!)
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}

