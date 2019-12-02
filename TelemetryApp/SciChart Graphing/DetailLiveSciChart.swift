//
//  SmallTelemetrySciChart.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/10/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class DetailLiveSciChart : TelemetrySCIChartSurface {
    
    var largestValueForYScaling: Float = 0
    var largestValueForXScaling: Float = 0
    var counter = 0
    let updateFreq = 50
    
    func initialize(key: String) {
        self.key = key
        
        self.translatesAutoresizingMaskIntoConstraints = true
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        self.xAxes.add(xAxis)
        
        let yAxis = SCINumericAxis()
        self.yAxes.add(yAxis)
        yAxis.autoRange = .never
        
        SCIThemeManager.applyTheme(toThemeable: self, withThemeKey: SCIChart_Bright_SparkStyleKey)
        
        // Apply theme before this line!
        createDataSeries()
        createRenderableSeries()
        
        self.isUserInteractionEnabled = false
        
    }
    
    func appendDataPointToDataSeries(dataPoint: DataPoint) {

        scatterDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(dataPoint.value))
        let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: dataPoint)
        lineDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(avgPoint))
        
        largestValueForXScaling = Float(dataPoint.time + (0.1*self.secondsInPastToPlot))
        
        if (dataPoint.value > largestValueForYScaling) {
            largestValueForYScaling = dataPoint.value + (0.2*dataPoint.value)
        }
        
        let visibleXRange = self.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
        visibleXRange.min = SCIGeneric(0)
        visibleXRange.max = SCIGeneric(largestValueForXScaling)
        
        let visibleYRange = self.yAxes.item(at: 0)?.visibleRange as! SCIDoubleRange
        visibleYRange.min = SCIGeneric(0)
        
        visibleYRange.max = SCIGeneric(largestValueForYScaling)
        
        self.invalidateElement()
        
    }
    
    func refreshGraph() {
        
        

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
        
        let sensor = Sensor(key: self.key)
        guard let points = Telemetry.shared.dataSource[sensor] else { return }
        
        let visibleYRange = self.yAxes.item(at: 0)?.visibleRange as! SCIDoubleRange
        
        for point in points {
            scatterDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: point)
            lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(avgPoint))
            
            visibleYRange.min = SCIGeneric(0)
            
            if (point.value > largestValueForYScaling) {
                largestValueForYScaling = point.value + (0.2*point.value)
            }
        }
        
        let visibleXRange = self.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
        visibleXRange.min = SCIGeneric(0)
        visibleXRange.max = SCIGeneric(points.last?.time ?? 10 + (0.1*self.secondsInPastToPlot))
        
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
