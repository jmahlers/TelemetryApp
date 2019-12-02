//
//  ViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class ConsoleViewController: UIViewController, TelemetryDelegate {

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
       console.text = "Connected"
    }
    
    //Triggers when the connection closes
    func manageComplete() {
        console.text = "Disconnected"
    }
    func newSensor(sensor: Sensor) {
    }
    
    @IBAction func connectButton(_ sender: Any) {
        Telemetry.shared.connect()
    }
    @IBAction func disconnectButton(_ sender: Any) {
        Telemetry.shared.disconnect()
    }
    
    @IBAction func clearUserData(_ sender: Any) {
        for sensor in Telemetry.shared.getFavoriteSensors(){
            sensor.removeFavorite()
        }
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "favoritesSensors")
        defaults.removeObject(forKey: "pinnedSensors")
        Telemetry.shared.favoritesDelegate?.favoritesChanged()
        Telemetry.shared.pinnedDelegate?.pinnedChanged()
    }
}

