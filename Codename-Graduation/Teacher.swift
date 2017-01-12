//
//  teacher.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 1/11/17.
//  Copyright © 2017 Joseph Cengel (student LM). All rights reserved.
//

import Foundation

class Teacher: NSObject, NSCoding{
	var name: String
	var compHW: Bool
	var testDiff: Bool
	var testCurve: Bool
	var strict: Float
	init(name: String, compHW: Bool, testDiff: Bool, testCurve: Bool, strict: Float){
		self.name = name
		self.compHW = compHW
		self.testDiff = testDiff
		self.testCurve = testCurve
		self.strict = strict
	}
	required init(coder decoder: NSCoder) {
		self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
		self.compHW = decoder.decodeBool(forKey: "compHW")
		self.testDiff = decoder.decodeBool(forKey: "testDiff")
		self.testCurve = decoder.decodeBool(forKey: "testCurve")
		self.strict = decoder.decodeFloat(forKey: "strict")
	}
	
	func encode(with coder: NSCoder) {
		coder.encode(name, forKey: "name")
		coder.encode(compHW, forKey: "compHW")
		coder.encode(testDiff, forKey: "testDiff")
		coder.encode(testCurve, forKey: "testCurve")
		coder.encode(strict, forKey: "strict")
	}
}

