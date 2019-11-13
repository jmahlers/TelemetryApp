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
    let hourly: [WeatherDataPoint]
}

