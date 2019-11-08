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
    var secondsInPastToPlot:Double = 10
    static let frequency:Double = 4
    
    func setUpXAxes() {
        self.xAxis.gridLineDashLengths = [10, 10]
        self.xAxis.gridLineDashPhase = 0
    }
    
    func setUpYAxes() {
        self.leftAxis.gridLineDashLengths = [5, 5]
        self.rightAxis.enabled = false
    }
    
}
