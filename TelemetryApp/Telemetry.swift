//
//  Telemetry.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import IKEventSource

///Protocol to proccess messages, and connection actions
protocol TelemetryDelegate: AnyObject{
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
    
    ///Delegate to process protocol methods
    weak var delegate:TelemetryDelegate?
    ///Dictionary of received messages
    var dataSource:[String: [Float]] = [:]
    ///Alphabetically sorted array of dataSource keys
    var sortedKeys:[String] = []
    ///Array of units sorted according to sortedKeys
    var sortedUnits:[String] = []
    ///Array of system identifiers sorted according to sortedKeys
    var sortedSystems:[String] = []
    ///Singleton of Telemetry that connects to the telemetry server
    static let shared = Telemetry()
    
    private init(){
        //Initializing instance variables
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
            do {
                let sensor = try JSONDecoder().decode(Sensor.self, from: jsonData!)
                if(self.dataSource[sensor.key] != nil){
                    self.dataSource[sensor.key]!.append(sensor.value)
                }else{
                    self.dataSource[sensor.key] = [sensor.value]
                    self.sortedKeys.append(sensor.key)
                    self.sortedUnits.append(sensor.unit ?? "N/A")
                    self.sortedSystems.append(sensor.system ?? "N/A")
                    //Creates a map so that the unit and system arrays can be sorted according to the keys array
                    let offsets = self.sortedKeys.enumerated().sorted(by: {$0.element < $1.element}).map {$0.offset}
                    self.sortedKeys = offsets.map {self.sortedKeys[$0]}
                    self.sortedUnits = offsets.map {self.sortedUnits[$0]}
                    self.sortedSystems = offsets.map {self.sortedSystems[$0]}
                }
                self.delegate?.manageMessage(sensor)
            } catch {
                print("Message decoded to an error")
            }
        }
        
        self.onComplete{ (status, shouldReconnect, netLayer) in
            print("Data source at connection close was:")
            print(self.dataSource)
            print(self.sortedKeys)
            print(self.sortedUnits)
            self.delegate?.manageComplete()
        }
    }
}
///Struct for json data from the telemetry server
struct Sensor: Decodable {
    let key: String
    let value: Float
    let unit: String?
    let system: String?
}
