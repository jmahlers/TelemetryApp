//
//  SmallTelemetryChartView.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/8/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import Charts

class SmallTelemetryChartView : LineChartView {
    
    var keyToGraph:String = ""
    var secondsInPastToPlot:Double = 10
    static let frequency:Double = 4
    
    var rollAvgStorage: [Float] = []
    let avgPeriod = 20 // Number of points
    var rollingIndex = 0
    
    func setUp(key: String) {
        self.keyToGraph = key
        self.setUpXAxes()
        self.setUpYAxes()
        self.legend.enabled = false
        self.xAxis.labelPosition = .bottom
    }
    
    func setUpXAxes() {
        self.xAxis.gridLineDashLengths = [10, 10]
        self.xAxis.gridLineDashPhase = 0
        self.xAxis.drawGridLinesEnabled = false
    }
    
    func setUpYAxes() {
        self.leftAxis.gridLineDashLengths = [3, 3]
        self.rightAxis.enabled = false
        self.leftAxis.drawGridLinesEnabled = true
    }
    
}
