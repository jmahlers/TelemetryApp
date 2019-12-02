//
//  SmallTelemetrySciChart.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/10/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class DetailSciChart : TelemetrySCIChartSurface {
    
    var largestValueForYScaling: Float = 0
    var largestValueForXScaling: Float = 0
    var counter = 0
    let updateFreq = 50
    
    func initialize(key: String) {
        
        self.key = key
        
        self.translatesAutoresizingMaskIntoConstraints = true
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.05), max: SCIGeneric(0.05))
        self.xAxes.add(xAxis)
        
        let yAxis = SCINumericAxis()
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.05), max: SCIGeneric(0.05))
        self.yAxes.add(yAxis)
        yAxis.autoRange = .always
        
        
        SCIThemeManager.applyTheme(toThemeable: self, withThemeKey: SCIChart_Bright_SparkStyleKey)
        
        // Apply theme before this line!
        createDataSeries()
        createRenderableSeries()
        
        self.isUserInteractionEnabled = true
        
        let pinchZoomModifier = SCIPinchZoomModifier()
        pinchZoomModifier.modifierName = "PinchZoomModifierName"
        self.chartModifiers.add(pinchZoomModifier)
        
    }
    
    func appendDataPointToDataSeries(dataPoint: DataPoint) {
        scatterDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(dataPoint.value))
        let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: dataPoint)
        lineDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(avgPoint))
        
        self.invalidateElement()
    }
    
    func clearData() {
        lineDataSeries.clear()
        scatterDataSeries.clear()
    }
    
    private func createDataSeries() {
        // Init line data series
        lineDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        lineDataSeries.seriesName = "line series"
        
        // Init scatter data series
        scatterDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        scatterDataSeries.fifoCapacity = 25
        scatterDataSeries.seriesName = "scatter series"
        
        let visibleYRange = self.yAxes.item(at: 0)?.visibleRange as! SCIDoubleRange
        visibleYRange.max = SCIGeneric(largestValueForYScaling)
        
    }
    
    private func createRenderableSeries(){
        lineRenderableSeries = SCIFastLineRenderableSeries()
        lineRenderableSeries.dataSeries = lineDataSeries
        lineRenderableSeries.strokeStyle = SCISolidPenStyle(color: UIColor.red, withThickness: 2)
        
        scatterRenderableSeries = SCIXyScatterRenderableSeries()
        scatterRenderableSeries.dataSeries = scatterDataSeries
        let marker = SCICrossPointMarker()
        marker.strokeStyle = SCISolidPenStyle(color: UIColor.black.withAlphaComponent(0.5), withThickness: 1)
        marker.height = 6.0
        marker.width = 6.0
        scatterRenderableSeries.pointMarker = marker
        scatterRenderableSeries.opacity = 0.8
        
        self.renderableSeries.add(lineRenderableSeries)
        self.renderableSeries.add(scatterRenderableSeries)
    }
}
