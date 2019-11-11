//
//  SmallTelemetrySciChart.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/10/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class SmallTelemetrySciChart : SCIChartSurface {
    
    var lineDataSeries: SCIXyDataSeries!
    var scatterDataSeries: SCIXyDataSeries!
    
    var lineRenderableSeries: SCIFastLineRenderableSeries!
    var scatterRenderableSeries: SCIXyScatterRenderableSeries!
    
}
