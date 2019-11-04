//
//  ViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TelemetryDelegate {

    @IBOutlet weak var console: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Telemetry.shared.delegate = self
        
        
    }
    
    
    //Triggers on received message
    func manageMessage(_ event: Sensor) {
        let consoleString = "Key is: "+event.key+" \nValue is: "+String(event.value)
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

