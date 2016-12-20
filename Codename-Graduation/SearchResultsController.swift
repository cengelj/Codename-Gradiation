//
//  searchDisplayController.swift
//  Codename-Graduation
//
//  Created by Joseph Cengel (student LM) on 12/16/16.
//  Copyright © 2016 Joseph Cengel (student LM). All rights reserved.
//

import UIKit
import WebKit

class SearchResultsController: UIViewController, WKUIDelegate, WKNavigationDelegate {
	var ID = ""
	var webView = WKWebView()
	
	override func viewDidLoad(){
		super.viewDidLoad()
		
		let jscript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
		let userScript = WKUserScript(source: jscript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
		let wkUController = WKUserContentController()
		wkUController.addUserScript(userScript)
		let wkWebConfig = WKWebViewConfiguration()
		wkWebConfig.userContentController = wkUController
		webView = WKWebView(frame: self.view.bounds, configuration: wkWebConfig)
		
		let url = URL(string: "https://nces.ed.gov/globallocator/col_info_popup.asp?ID=\(ID)")!
		
		webView.load(URLRequest(url: url))
		self.view = webView
	}
	
}


