//
//  Telemetry.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import IKEventSource

protocol TelemetryDelegate{
    func manageMessage(_ event: Sensor)
    func manageOpen()
    func manageComplete()
}

//Any use of Telemetry must use the format Telemetry.shared._
//It is a singleton to ensure there is only ever one Telemetry object
//As a singleton, Telemetry.shared has global scope

class Telemetry: EventSource {
    
    //Instance variables
    var isInBackground:Bool
    var console:String
    var delegate:TelemetryDelegate?
    var dataSource:[String: [Float]] = [:]
    
    //Initialize telemetry singleton
    static let shared = Telemetry()
    
    private init(){
        //Initializing instance variables
        self.console = ""
        self.isInBackground = false
        let urlString =  "https://api.data.wuracing.com/api/telemetry"
        let url = URL(string: urlString)
        
        //Initialize EventSource
        super.init(url: url!)
        
        self.onOpen{
            print("Connection to " + urlString + " open")
            self.delegate?.manageOpen()
        }
        
        self.onMessage{ (id, event, data) in
            print("Recieved message")
            let jsonData = data!.data(using: .utf8)
            let decoder = JSONDecoder()
            do {
                let sensor = try decoder.decode(Sensor.self, from: jsonData!)
                if(self.dataSource[sensor.key] != nil){
                    self.dataSource[sensor.key]!.append(sensor.value)
                }else{
                    self.dataSource[sensor.key] = [sensor.value]
                }
                self.delegate?.manageMessage(sensor)
            } catch {
                print("Message decoded to an error")
            }
        }
        
        self.onComplete{ (status, shouldReconnect, netLayer) in
            print(self.dataSource)
            self.delegate?.manageComplete()
        }
    }
}

struct Sensor: Decodable {
    let key: String
    let value: Float
}
