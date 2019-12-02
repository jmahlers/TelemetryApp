//
//  SmallTelemetrySciChart.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/10/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class SmallLiveSciChart : TelemetrySCIChartSurface {
    
    func initialize(key: String) {
        self.key = key

        self.translatesAutoresizingMaskIntoConstraints = true
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        self.xAxes.add(xAxis)
    
        let yAxis = SCINumericAxis()
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(1), max: SCIGeneric(1))
        self.yAxes.add(yAxis)
        yAxis.autoRange = .always
        
        SCIThemeManager.applyTheme(toThemeable: self, withThemeKey: SCIChart_Bright_SparkStyleKey)

        // Apply theme before this line!
        createDataSeries()
        createRenderableSeries()
        
        self.isUserInteractionEnabled = false
        
    }
    
    func updateWithManyNewMessages(timeOfLastMessage: Double) {
        
        let sensor = Sensor(key: self.key)
        guard let points = Telemetry.shared.dataToPlot[sensor] else { return }
        
        for point in points {
            scatterDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: point)
            lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(avgPoint))
        }
        
        let visibleRange = self.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
        visibleRange.min = SCIGeneric(timeOfLastMessage - self.secondsInPastToPlot)
        visibleRange.max = SCIGeneric(timeOfLastMessage + (0.1*self.secondsInPastToPlot))
        
        self.invalidateElement()
        
        Telemetry.shared.dataToPlot[sensor]?.removeAll()
        
    }
    
    func clearData() {
        lineDataSeries.clear()
        scatterDataSeries.clear()
    }
    
    private func createDataSeries() {
        // Init line data series
        lineDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        lineDataSeries.fifoCapacity = Int32(self.secondsInPastToPlot*SmallLiveSciChart.frequency+Double(self.avgPeriod))
        lineDataSeries.seriesName = "line series"
        
        // Init scatter data series
        scatterDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        scatterDataSeries.fifoCapacity = 25
        scatterDataSeries.seriesName = "scatter series"
        
        let sensor = Sensor(key: self.key)
        guard let points = Telemetry.shared.dataToPlot[sensor] else { return }
        
        for point in points {
            scatterDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: point)
            lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(avgPoint))
        }
        
        Telemetry.shared.dataToPlot[sensor]?.removeAll()
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
