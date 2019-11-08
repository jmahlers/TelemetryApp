//
//  TelemetryLineChartView.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import Charts

class TelemetryLineChartView : LineChartView {
    
    var keyToGraph:String = ""
    var secondsInPastToPlot:Double = 30
    static let frequency:Double = 4
    
}
