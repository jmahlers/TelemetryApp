//
//  SciChartRollingAverageUtils.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/11/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class RollingAverageUtils {
    
    static func computeRollingAverageForDataPoint(chart: TelemetrySCIChartSurface, point: DataPoint) -> Double {
        
        if chart.rollAvgStorage.count < chart.avgPeriod {
            chart.rollAvgStorage.append(point.value)
        } else {
            chart.rollAvgStorage[chart.rollingIndex] = point.value
        }
        
        let sum = chart.rollAvgStorage.reduce(0) { $0 + $1 }
        let currAvg:Double = Double(sum) / Double(chart.rollAvgStorage.count)
        
        chart.rollingIndex += 1
        if chart.rollingIndex == chart.rollAvgStorage.count {
            chart.rollingIndex = 0
        }
        
        return currAvg
    }
    
}
