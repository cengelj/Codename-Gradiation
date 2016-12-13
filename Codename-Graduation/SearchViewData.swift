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
    var collegeDictionary: [String:Int]?
    let searchDataURL = "collegeInfo"
	
	override init(){
		super.init()
		data = ["one", "two", "three"]
        readDataFromFile(file: searchDataURL)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tabRet = UITableViewCell()
		tabRet.backgroundColor = UIColor.darkGray
		tabRet.textLabel!.font = UIFont(name: "helvetica neue", size: 20)
		tabRet.textLabel?.textAlignment = .center
		tabRet.textLabel?.text = data?[indexPath.row]
		
		return tabRet
	}
    
    func readDataFromFile(file: String?) throws -> [String] {
        guard let path = Bundle.main.path(forResource: file, ofType: nil) else {
            throw NSError(domain: NSCocoaErrorDomain, code: NSFileNoSuchFileError, userInfo: [ NSFilePathErrorKey : file! ])
        }
        let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        print(path)
        print(content)
        return content.components(separatedBy: String)
    }
    
    func dataTranslation(){
        
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data!.count
	}
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
}
