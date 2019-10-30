//
//  Telemetry.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import IKEventSource

protocol TelemetryDelegate{
    func manageEvent(_ event: Sensor)
    func manageToText(_ text: String)
    func manageOnOpen()
}

//All the commented out code is code that was for testing the SSE test. Will delete - JA 10/30

class Telemetry: EventSource {
    
    var delegate:TelemetryDelegate?
    var console = ""
    
    init(){
        let urlString =  "https://api.data.wuracing.com/api/telemetry"
        let url = URL(string: urlString)
        super.init(url: url!)
        //self.toText(urlString)
        
        self.onOpen{
            //self.toText("Successfully connected")
        }
        
        self.onMessage{ (id, event, data) in
            let jsonData = data!.data(using: .utf8)
            let decoder = JSONDecoder()
            
            do {
                let sensor = try decoder.decode(Sensor.self, from: jsonData!)
                self.delegate?.manageEvent(sensor)
                /*
                self.toText("Key is")
                self.toText(sensor.key)
                self.toText("Value is")
                self.toText(String(sensor.value))
                */
                
            } catch {
                //self.toText("Boogaloo3")
            }
            
            
            
        }
        self.onComplete{ (status, shouldReconnect, netLayer) in
            //self.toText("Finished onComplete")
        }
        
    }
    
    func toText(_ text: String){
        print(text)
        /*self.console.append("\n"+text)
        self.delegate?.manageToText(text)
         */
    }
}

struct Sensor: Decodable {
    let key: String
    let value: Float
}
