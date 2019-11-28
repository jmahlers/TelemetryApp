//
//  Weather.swift
//  TelemetryApp
//
//  Created by Blake Dorris on 11/13/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import UIKit

struct Weather : Decodable {
    let latitude: Float
    let longitude: Float
    let timezone: String
    let hourly: DataBlock
}
struct DataBlock: Decodable {
    
    /// A human-readable text summary.
    public let summary: String?
   
    /// `DataPoint`s ordered by time, which describe the weather conditions at the requested location over time.
    public let data: [WeatherDataPoint]
    
}


struct WeatherDataPoint : Decodable {
    let apparentTemperature: Float?
    let humidity: Float?
    let precipProbability: Float?
    let precipType: String?
    let temperature: Float?
    let time: Float!
    let windBearing: Int?
    let windGust: Float?
    let windSpeed: Float?
    let icon: String?
    
}
