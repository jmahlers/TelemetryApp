//
//  ViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TelemetryDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This is the format any view should use to interact with the EventSource
        Telemetry.shared.delegate = self
        
        
    }

    //Triggers on received  message
    func manageMessage(_ event: SensorReading) {
        //Todo
    }
    
    //Triggers when the connection opens
    func manageOpen() {
        //Todo
    }
    
    //Triggers when the connection closes
    func manageComplete() {
        //Todo
    }
    
}

