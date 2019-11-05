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
    func manageMessage(_ event: SensorReading)
    ///Triggers upon opening server connection
    func manageOpen()
    ///Triggers upon closing server connection
    func manageComplete()
}

//Any use of Telemetry must use the format Telemetry.shared._
//It is a singleton to ensure there is only ever one Telemetry object
//As a singleton, Telemetry.shared has global scope
//This class is extended within KeySorter.swift which deals with the sorting of keys by priority and alphabetical order

///Class of type EventSource that contains a singleton instance of itself
class Telemetry: EventSource {
    ///Delegate to process protocol methods
    weak var delegate:TelemetryDelegate?
    ///Dictionary of received messages
    var dataSource:[String: [Float]] = [:]
    ///Priority & alphabetically sorted array of sensors
    var sortedSensors:[Sensor] = []
    ///Dictionary to assign higher sorting priority to specific keys
    internal var keyPriority:[String:Int] = [:]
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
                let sensorReading = try JSONDecoder().decode(SensorReading.self, from: jsonData!)
                if(self.dataSource[sensorReading.key] != nil){
                    self.dataSource[sensorReading.key]!.append(sensorReading.value)
                }else{
                    self.dataSource[sensorReading.key] = [sensorReading.value]
                    self.sortedSensors.append(Sensor(sensorReading))
                    self.sortedSensors.sort()
                }
                self.delegate?.manageMessage(sensorReading)
            } catch {
                print("Message decoded to an error")
            }
        }
        
        self.onComplete{ (status, shouldReconnect, netLayer) in
            print("Data source at connection close was:")
            print(self.dataSource)
            print(self.sortedSensors)
            print(self.keyPriority)
            self.delegate?.manageComplete()
        }
    }
}

///Struct for json data from the telemetry server
struct SensorReading: Decodable {
    //Whenever a new <field> is added, a sortedField array must be added and it must be added to sortTelemetry()
    let key: String
    let value: Float
    let unit: String?
    let description: String?
    //Connor has not implimented system yet
    let system: String?
}

///Struct for for sensors. Contains key, unit, description, and system
struct Sensor: Comparable{
    let key: String
    let unit: String
    let description: String
    //Connor has not implimented system yet
    let system: String
    init(key: String, unit:String?, description:String?, system:String?){
        self.key = key
        self.unit = unit ?? "N/A"
        self.description = description ?? "N/A"
        self.system = system ?? "N/A"
    }
    
    init(_ sensorReading: SensorReading){
        self.key = sensorReading.key
        self.unit = sensorReading.unit ?? "N/A"
        self.description = sensorReading.description ?? "N/A"
        self.system = sensorReading.system ?? "N/A"
    }
    
    static func < (lhs: Sensor, rhs: Sensor) -> Bool {
        let lhsKey = lhs.key
        let rhsKey = rhs.key
        if(Telemetry.shared.keyPriority[lhsKey] != nil){
            if(Telemetry.shared.keyPriority[rhsKey] != nil){
                return Telemetry.shared.keyPriority[lhsKey]! < Telemetry.shared.keyPriority[rhsKey]!
            }else{
                return true
            }
        }else{
            if(Telemetry.shared.keyPriority[rhsKey] != nil){
                return false
            }else{
                return lhsKey<rhsKey
            }
        }
    }
    
}
