//
//  LineChart1ViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

import UIKit
import Charts

extension TelemetryViewController {
    
    func computeRollingAverageForDataPoint(chart: SmallTelemetryChartView, point: DataPoint) -> ChartDataEntry {
        
        if chart.rollAvgStorage.count < chart.avgPeriod {
            chart.rollAvgStorage.append(point.value)
        } else {
            chart.rollAvgStorage[chart.rollingIndex] = point.value
        }
        
        let sum = chart.rollAvgStorage.reduce(0) { $0 + $1 }
        let currAvg:Double = Double(sum) / Double(chart.rollAvgStorage.count)
        
        let entry = ChartDataEntry(x: point.time, y: currAvg)
        
        chart.rollingIndex += 1
        if chart.rollingIndex == chart.rollAvgStorage.count {
            chart.rollingIndex = 0
        }
        
        return entry
    }
    
    func computeRollingAverageEntriesForDataSet(chart: SmallTelemetryChartView, points: [DataPoint]) -> [ChartDataEntry] {
        chart.rollingIndex = 0
        chart.rollAvgStorage.removeAll()
        
        var rollAvgEntries: [ChartDataEntry] = []
        
        for i in 0..<points.count {
            if chart.rollAvgStorage.count < chart.avgPeriod {
                chart.rollAvgStorage.append(points[i].value)
            } else {
                chart.rollAvgStorage[chart.rollingIndex] = points[i].value
            }
            
            let sum = chart.rollAvgStorage.reduce(0) { $0 + $1 }
            let currAvg:Double = Double(sum) / Double(chart.rollAvgStorage.count)
            
            rollAvgEntries.append(ChartDataEntry(x: points[i].time, y: currAvg))
            
            chart.rollingIndex += 1
            if chart.rollingIndex == chart.rollAvgStorage.count {
                chart.rollingIndex = 0
            }
        }
        
        return rollAvgEntries
    }
    
    
}
