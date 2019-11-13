//
//  WeatherDataPoint.swift
//  TelemetryApp
//
//  Created by Blake Dorris on 11/13/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import UIKit

struct WeatherDataPoint : Decodable {
    let summary: String?
    let apparentTemperature: Float?
    let humidity: Float?
    let icon: String?
    let precipProbability: Float?
    let precipType: String?
    let temperature: Float?
    let time: Float!
    let windBearing: Int?
    let windGust: Float?
    let windSpeed: Float?
    
}
