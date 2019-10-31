//
//  Telemetry.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import IKEventSource

protocol TelemetryDelegate {
    
    func manageMessage(_ event: SensorReading)
    func manageOpen()
    func manageComplete()
    
}

//Most of the commented out code is code that was for testing the SSE test. Will delete - JA 10/30

//Any use of Telemetry must use the format Telemetry.shared._
//It is a singleton to ensure there is only ever one Telemetry object
//As a singleton, Telemetry.shared has global scope

class Telemetry: EventSource {
    
    //Instance variables
    var isInBackground:Bool
    var console:String
    var delegate:TelemetryDelegate?
    
    //Initialize telemetry singleton
    static let shared = Telemetry()
    
    private init(){
        self.console = ""
        self.isInBackground = false
        let urlString =  "https://api.data.wuracing.com/api/telemetry"
        let url = URL(string: urlString)
        super.init(url: url!)
        //self.toText(urlString)
        
        self.onOpen{
            self.delegate?.manageOpen()
        }
        
        self.onMessage{ (id, event, data) in
            let jsonData = data!.data(using: .utf8)
            let decoder = JSONDecoder()
            
            do {
                let sensorReading = try decoder.decode(SensorReading.self, from: jsonData!)
                self.delegate?.manageMessage(sensorReading)
                
                sensorReading.toText()
                
            } catch {
                print("Sensor reading could not be decoded from JSON data")
            }
        }
        
        self.onComplete{ (status, shouldReconnect, netLayer) in
            self.delegate?.manageComplete()
        }
        
    }

}
