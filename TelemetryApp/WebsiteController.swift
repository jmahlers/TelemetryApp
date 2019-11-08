//
//  Website.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import WebKit

class WebsiteController: UIViewController{
    
    @IBOutlet weak var website: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://sae.wustl.edu/login.html"
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        website.load(urlRequest)
    }
    
}
