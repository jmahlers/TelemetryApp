//
//  SmallTelemetrySciChart.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/10/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class TelemetrySCIChartSurface : SCIChartSurface {
    
    var key:String = ""
    var secondsInPastToPlot:Double = 30
    static let frequency:Double = 4 // Hz
    
    var rollAvgStorage: [Float] = []
    let avgPeriod = 10 // Number of points
    var rollingIndex = 0
    
    var lineDataSeries: SCIXyDataSeries!
    var scatterDataSeries: SCIXyDataSeries!
    
    var lineRenderableSeries: SCIFastLineRenderableSeries!
    var scatterRenderableSeries: SCIXyScatterRenderableSeries!
}

extension TelemetrySCIChartSurface : Comparable {
    static func < (lhs: TelemetrySCIChartSurface, rhs: TelemetrySCIChartSurface) -> Bool {
        return lhs.key < rhs.key
    }
}
