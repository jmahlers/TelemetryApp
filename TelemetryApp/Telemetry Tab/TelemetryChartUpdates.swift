//
//  TelemetryChartUpdating.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/9/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import Charts
extension TelemetryViewController{
    
    func updateChartData(chart: SmallTelemetryChartView) {
        guard let points = Telemetry.shared.dataSource[Sensor(key: chart.keyToGraph)] else {
            print("Data couldn't be accessed from telemetry data source (it probably doesn't exist)")
            return
        }
        
        var rawEntries:[ChartDataEntry] = []
        
        let rollingAvgEntries:[ChartDataEntry] = computeRollingAverageEntriesForDataSet(chart: chart, points: points)
        
        for point in points {
            let entry:ChartDataEntry = ChartDataEntry(x: point.time, y: Double(point.value))
            rawEntries.append(entry)
        }
        
        let rawDataSet = setUpRawDataSet(chart: chart, entries: rawEntries)
        let rollAvgDataSet = setUpRollingAvgDataSet(entries: rollingAvgEntries)
        
        
        let chartData = LineChartData(dataSets: [rawDataSet, rollAvgDataSet])
        
        chart.data = chartData
    }
}
