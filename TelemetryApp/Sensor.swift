//
//  Sensor.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/5/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

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
struct Sensor: Comparable, Hashable{
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
    static func == (lhs: Sensor, rhs: Sensor)-> Bool {
        if(lhs.key == rhs.key && lhs.unit == rhs.unit && lhs.description == rhs.description && lhs.system == rhs.system){
            return true
        }else{
            return false
        }
    }
}
