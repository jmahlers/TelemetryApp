//
//  BugReportController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/11/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class BugReportController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func returnPressed(_ sender: Any) {
        commitBugReport()
    }
    
    @IBAction func commitButton(_ sender: Any) {
        commitBugReport()
    }
    func commitBugReport(){
        //This requires team sign-off for google account access. Will implement in the future using the google sheets api
        textField.text = ""
    }
}
