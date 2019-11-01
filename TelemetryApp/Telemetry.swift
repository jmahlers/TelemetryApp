//
//  Telemetry.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import IKEventSource

protocol TelemetryDelegate{
    ///Triggers upon incoming event
    func manageMessage(_ event: Sensor)
    ///Triggers upon opening server connection
    func manageOpen()
    ///Triggers upon closing server connection
    func manageComplete()
}

//Any use of Telemetry must use the format Telemetry.shared._
//It is a singleton to ensure there is only ever one Telemetry object
//As a singleton, Telemetry.shared has global scope

///Class of type EventSource that contains a singleton instance of itself
class Telemetry: EventSource {
    
    var isInBackground:Bool
    ///Delegate to process protocol methods
    var delegate:TelemetryDelegate?
    ///Dictionary of recieved messages
    var dataSource:[String: [Float]] = [:]
    
    ///Singleton of Telemetry that connects to the telemetry server
    static let shared = Telemetry()
    
    private init(){
        //Initializing instance variables
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
            print("Received message")
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
            print("Data source at connection closing was:")
            print(self.dataSource)
            self.delegate?.manageComplete()
        }
    }
}

struct Sensor: Decodable {
    let key: String
    let value: Float
}
