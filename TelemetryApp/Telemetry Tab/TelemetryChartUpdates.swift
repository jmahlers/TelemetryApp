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
        
        var lastPoint = points.last
        var suffixLength = 0
        
        var index = points.count - 2
        if lastPoint != nil && index > 0 {
            while lastPoint!.time - points[index].time < chart.secondsInPastToPlot {
                if index == 1 {
                    break
                }
                index -= 1
            }
            suffixLength = (points.count - 2) - index

        }
        
        
        
        var mostRecentData: [DataPoint] = points.suffix(suffixLength + chart.avgPeriod)
        lastPoint = mostRecentData.last
        if lastPoint != nil {
            let difference = lastPoint!.time - chart.secondsInPastToPlot
            for i in 0..<mostRecentData.count {
                mostRecentData[i].time -= difference
            }
        }
        
        
        var rawEntries:[ChartDataEntry] = []
        
        let rollingAvgEntries:[ChartDataEntry] = computeRollingAverageEntriesForDataSet(chart: chart, points: mostRecentData)
        
        for point in mostRecentData {
            let entry:ChartDataEntry = ChartDataEntry(x: point.time, y: Double(point.value))
            rawEntries.append(entry)
        }
        
        let rawDataSet = setUpRawDataSet(chart: chart, entries: rawEntries)
        let rollAvgDataSet = setUpRollingAvgDataSet(entries: rollingAvgEntries)
        
        
        let chartData = LineChartData(dataSets: [rawDataSet, rollAvgDataSet])
        
        chart.data = chartData
        
        chart.xAxis.axisMaximum = chart.secondsInPastToPlot + (chart.secondsInPastToPlot * 0.2)
        chart.xAxis.axisMinimum = 0
    }
}
