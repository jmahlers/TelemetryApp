//
//  ViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, TelemetryDelegate, ChartViewDelegate {

    @IBOutlet weak var console: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        Telemetry.shared.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Telemetry.shared.delegate = self
        
        
    }
    
    //Triggers on received message
    func manageMessage(key: String, dataPoint: DataPoint) {
        let consoleString = "Key is: "+key+" \nValue is: "+String(dataPoint.value)
        console.text = consoleString
    }
    
    //Triggers when the connection opens
    func manageOpen() {
       console.text = "Open"
    }
    
    //Triggers when the connection closes
    func manageComplete() {
        console.text = "Disconnected"
    }
    
    @IBAction func disconnectButton(_ sender: Any) {
        Telemetry.shared.disconnect()
    }
}

