//
//  SearchViewData.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/8/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit

class SearchViewData: NSObject, UITableViewDataSource{
	var data = [String]()
	var filteredData = [String]()
    var collegeDictionary = [String:String]()
    let searchDataURL = "collegeInfo"
	
	override init(){
		super.init()
        UserDefaults.resetStandardUserDefaults()
		if let dt = UserDefaults.standard.array(forKey: "collegeArray"), let cd = UserDefaults.standard.dictionary(forKey: "collegeDictionary"){
			//Only works because we're the only ones doing the saving...
			collegeDictionary = cd as! [String : String]
			data = dt as! [String]
			filteredData = data
		}
		else{///Users/s011878/Documents/XCode/Codename-Graduation/Codename-Graduation/
			if let aStreamReader = StreamReader(path: "collegeInfo.csv") {
				defer {
					aStreamReader.close()
				}
				//PLEASE DONT TOUCH, IT WORKS BUT ANY CHANGES AT ALL COULD MAKE IT NOT
				while let line = aStreamReader.nextLine() {
					var nameFound = false
					var nameEnd = true
					var IDEnd = true
					var name = ""
					var ID = ""
					var quoteCount = 0
					var priorQuote = false
					var priorQuotes = 0
					loop: for character in line.characters {
						if !nameFound {
							if character == "\""{
								priorQuote = !priorQuote
								priorQuotes = 1
							}
							else if character == "," && !priorQuote{
								if !nameEnd {
									nameFound = true
								}
								nameEnd = !nameEnd
							}
							else if !nameEnd {
								name.append(character)
							}
						}
						else {
							if character == "\"" {
								quoteCount += 1
							}
							else if quoteCount == 11+priorQuotes{
								quoteCount = 12+priorQuotes
							}
							else if quoteCount == 12+priorQuotes{
								if character == ","{
									IDEnd = !IDEnd
								}
								else if !IDEnd {
									ID.append(character)
								}
								else if IDEnd{
									let temp = Int(ID)
									if(ID != "" && temp != nil){
										collegeDictionary[name] = ID
										if !(data.contains(name)){
											data.insert(name, at: (data.count))
											print("Found School \(name) ID: \(ID)")
										}
									}
									break loop
								}
							}
						}
					}
				}
			}
			data.sort()
			filteredData = data
			UserDefaults.standard.setValue(collegeDictionary, forKey: "collegeDictionary")
			UserDefaults.standard.setValue(data, forKey: "collegeArray")
			UserDefaults.standard.synchronize()
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tabRet = UITableViewCell()
		tabRet.backgroundColor = .clear
		tabRet.textLabel!.font = UIFont(name: "helvetica neue", size: 20)
		tabRet.textLabel?.textAlignment = .center
		tabRet.textLabel?.text = filteredData[indexPath.row]
		
		return tabRet
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredData.count
	}
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	func filter(searchText: String, tableView: UITableView){
		resetSearch(tableView: tableView)
		for i in stride(from: filteredData.count-1, through: 0, by: -1){
			if filteredData[i].contains(searchText) == false{
				filteredData.remove(at: i)
			}
		}
		if filteredData.count == 0{
			resetSearch(tableView: tableView)
		}
		else{
			tableView.reloadData()
		}
	}
	func resetSearch(tableView: UITableView){
		filteredData = data
		tableView.reloadData()
	}
}

// Credit Martin R @ http://stackoverflow.com/questions/24581517/read-a-file-url-line-by-line-in-swift
// This is used to parse through large files to prevent overflows while reading through thousands of lines of text 
// Don't Touch

class StreamReader  {
    
    let encoding : String.Encoding
    let chunkSize : Int
    var fileHandle : FileHandle!
    let delimData : Data
    var buffer : Data
    var atEof : Bool
    
    init?(path: String, delimiter: String = "\n", encoding: String.Encoding = .utf8,
          chunkSize: Int = 4096) {
        
        guard let fileHandle = FileHandle(forReadingAtPath: path),
            let delimData = delimiter.data(using: encoding) else {
                return nil
        }
        self.encoding = encoding
        self.chunkSize = chunkSize
        self.fileHandle = fileHandle
        self.delimData = delimData
        self.buffer = Data(capacity: chunkSize)
        self.atEof = false
    }
    
    deinit {
        self.close()
    }
    
    /// Return next line, or nil on EOF.
    func nextLine() -> String? {
        precondition(fileHandle != nil, "Attempt to read from closed file")
        
        // Read data chunks from file until a line delimiter is found:
        while !atEof {
            if let range = buffer.range(of: delimData) {
                // Convert complete line (excluding the delimiter) to a string:
                let line = String(data: buffer.subdata(in: 0..<range.lowerBound), encoding: encoding)
                // Remove line (and the delimiter) from the buffer:
                buffer.removeSubrange(0..<range.upperBound)
                return line
            }
            let tmpData = fileHandle.readData(ofLength: chunkSize)
            if tmpData.count > 0 {
                buffer.append(tmpData)
            } else {
                // EOF or read error.
                atEof = true
                if buffer.count > 0 {
                    // Buffer contains last line in file (not terminated by delimiter).
                    let line = String(data: buffer as Data, encoding: encoding)
                    buffer.count = 0
                    return line
                }
            }
        }
        return nil
    }
    
    /// Start reading from the beginning of file.
    func rewind() -> Void {
        fileHandle.seek(toFileOffset: 0)
        buffer.count = 0
        atEof = false
    }
    
    /// Close the underlying file. No reading must be done after calling this method.
    func close() -> Void {
        fileHandle?.closeFile()
        fileHandle = nil
    }
}

extension StreamReader : Sequence {
    func makeIterator() -> AnyIterator<String> {
        return AnyIterator {
            return self.nextLine()
        }
    }
} // End of Credited Code
