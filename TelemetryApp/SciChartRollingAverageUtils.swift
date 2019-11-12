//
//  SciChartRollingAverageUtils.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/11/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class SciChartRollingAverageUtils {
    
    static func computeRollingAverageForDataPoint(chart: SmallTelemetrySciChart, point: DataPoint) -> Double {
        
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
    
//    func computeRollingAverageForDataSet(chart: SmallTelemetrySciChart, points: [DataPoint]) -> [Double] {
//        
//        chart.rollingIndex = 0
//        chart.rollAvgStorage.removeAll()
//        
//        var rollingAvgValues: [Double] = []
//        
//        for i in 0..<points.count {
//            if chart.rollAvgStorage.count < chart.avgPeriod {
//                chart.rollAvgStorage.append(points[i].value)
//            } else {
//                chart.rollAvgStorage[chart.rollingIndex] = points[i].value
//            }
//            
//            let sum = chart.rollAvgStorage.reduce(0) { $0 + $1 }
//            let currAvg:Double = Double(sum) / Double(chart.rollAvgStorage.count)
//            
//            rollingAvgValues.append(currAvg)
//            
//            chart.rollingIndex += 1
//            if chart.rollingIndex == chart.rollAvgStorage.count {
//                chart.rollingIndex = 0
//            }
//        }
//        
//        return rollingAvgValues
//    }
    
}
