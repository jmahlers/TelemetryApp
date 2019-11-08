//
//  Sensor.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/5/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

//Extensions for favoriting are located in Telemetry.swift do to fileprivate status

///Struct for json data from the telemetry server
struct SensorReading: Decodable {
    let key: String
    let value: Float
    let unit: String?
    let description: String?
    let system: String?
}

struct DataPoint {
    let key: String
    let time: Double
    let value: Float
    
    init(time: Double, sensorReading: SensorReading){
        self.key = sensorReading.key
        self.time = time
        self.value = sensorReading.value
    }
}

///Struct for for sensors. Contains key, unit, description, and system
struct Sensor: Comparable, Hashable{
    let key: String
    let unit: String
    let description: String
    let system: String
    
    init(key: String){
        self.key = key
        self.unit = "N/A"
        self.description = "N/A"
        self.system = "N/A"
    }
    
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
        /*
         //Removed with Priority.swift removal
         if(Telemetry.shared.sensorPriority[lhs] != nil){
         if(Telemetry.shared.sensorPriority[rhs] != nil){
         return Telemetry.shared.sensorPriority[lhs]! < Telemetry.shared.sensorPriority[rhs]!
         }else{
         return true
         }
         }else{
         if(Telemetry.shared.sensorPriority[rhs] != nil){
         return false
         }else{
         return lhsKey<rhsKey
         }
         }
         */
        return lhsKey<rhsKey
    }
    
    static func == (lhs: Sensor, rhs: Sensor)-> Bool {
        if(lhs.key == rhs.key){
            return true
        }else{
            return false
        }
    }
    
}
