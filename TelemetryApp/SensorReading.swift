//
//  Sensor.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation

class SensorReading: Decodable {
    let key: String
    let value: Float
    
    func toText() {
        print("Type: \(self.key) \t Value: \(self.value)")
    }
}
