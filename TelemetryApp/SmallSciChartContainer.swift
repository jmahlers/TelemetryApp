//
//  SmallTelemetrySciChart.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/10/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class SmallSciChartContainer : UIView {
    
    var chart = SCIChartSurface(frame: CGRect.zero)
    
    var key:String = ""
    var secondsInPastToPlot:Double = 10
    static let frequency:Double = 4
    
    var rollAvgStorage: [Float] = []
    let avgPeriod = 10 // Number of points
    var rollingIndex = 0
    
    var lineDataSeries: SCIXyDataSeries!
    var scatterDataSeries: SCIXyDataSeries!
    
    var lineRenderableSeries: SCIFastLineRenderableSeries!
    var scatterRenderableSeries: SCIXyScatterRenderableSeries!
    
    func initialize(key: String) {
        self.key = key
//        chart.applyThemeProvider(SCIThemeManager.themeProvider(with: SCIChart_Bright_SparkStyleKey))

        chart.translatesAutoresizingMaskIntoConstraints = true
        // Set the autoResizingMask property so the chart will fit the screen when we rotate the device
        chart.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        chart.xAxes.add(xAxis)
    
        let yAxis = SCINumericAxis()
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(1), max: SCIGeneric(1))
        chart.yAxes.add(yAxis)
        yAxis.autoRange = .always
        
        SCIThemeManager.applyTheme(toThemeable: chart, withThemeKey: SCIChart_Bright_SparkStyleKey)

        // Apply theme before this line!
        createDataSeries()
        createRenderableSeries()
        addModifiers()
        
        

        chart.isUserInteractionEnabled = false
        
        
        
        
        chart.frame = self.frame
        self.addSubview(chart)
        
    }
    
    
    func updateWithNewMessage(dataPoint: DataPoint) {
        DispatchQueue.global().sync {
            self.scatterDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(dataPoint.value))
            let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: dataPoint)
            self.lineDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(avgPoint))
            
            let maxIndex = self.lineDataSeries.count() - 1
            
            let max = SCIGenericDouble(self.lineDataSeries.xValues().value(at: maxIndex))
            
            let visibleRange = chart.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
            
            visibleRange.min = SCIGeneric(dataPoint.time - self.secondsInPastToPlot)
            visibleRange.max = SCIGeneric(dataPoint.time + 1)
            
            chart.invalidateElement()
        }
    }
    
    func updateWithManyNewMessages() {
        
        let sensor = Sensor(key: self.key)
        guard let points = Telemetry.shared.dataToPlot[sensor] else { return }
        
        for point in points {
            scatterDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: point)
            lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(avgPoint))
        }
        
        Telemetry.shared.dataToPlot[sensor]?.removeAll()
        
    }
    
    func clearData() {
        lineDataSeries.clear()
        scatterDataSeries.clear()
    }
    
    private func addModifiers(){
//        let xAxisDragmodifier = SCIXAxisDragModifier()
//        xAxisDragmodifier.dragMode = .pan
//        xAxisDragmodifier.clipModeX = .none
//
//        let yAxisDragmodifier = SCIYAxisDragModifier()
//        yAxisDragmodifier.dragMode = .pan
//
//        let extendZoomModifier = SCIZoomExtentsModifier()
//        let pinchZoomModifier = SCIPinchZoomModifier()
//
//        let rolloverModifier = SCIRolloverModifier()
//        let legend = SCILegendModifier()
//
//        let groupModifier = SCIChartModifierCollection(childModifiers: [xAxisDragmodifier, yAxisDragmodifier, pinchZoomModifier, extendZoomModifier, legend, rolloverModifier])
//
//        chart.chartModifiers = groupModifier
    }
    
    private func createDataSeries() {
        // Init line data series
        lineDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        lineDataSeries.fifoCapacity = Int32(self.secondsInPastToPlot*SmallSciChartContainer.frequency+Double(self.avgPeriod))
        lineDataSeries.seriesName = "line series"
        
        // Init scatter data series
        scatterDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        scatterDataSeries.fifoCapacity = 10
        scatterDataSeries.seriesName = "scatter series"
        
        guard let points = Telemetry.shared.dataSource[Sensor(key: self.key)] else {
            print("Data couldn't be accessed from telemetry data source (it probably doesn't exist)")
            return
        }
        
        let suffixLength = Int("\(self.lineDataSeries?.fifoCapacity)")
        let recentPoints:[DataPoint] = points.suffix(suffixLength ?? Int(self.secondsInPastToPlot*SmallSciChartContainer.frequency))
        
        for point in recentPoints {
            scatterDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: point)
            lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(avgPoint))
        }
        
    }
    
    private func createRenderableSeries(){
        lineRenderableSeries = SCIFastLineRenderableSeries()
        lineRenderableSeries.dataSeries = lineDataSeries
//        lineRenderableSeries.strokeStyle = SCISolidPenStyle(colorCode: 0x0f7fffff, withThickness: 2)
        
        scatterRenderableSeries = SCIXyScatterRenderableSeries()
        scatterRenderableSeries.dataSeries = scatterDataSeries
//        let marker = SCICrossPointMarker()
//        marker.strokeStyle = SCISolidPenStyle(colorCode: 0x00000000, withThickness: 1)
//        marker.height = 6.0
//        marker.width = 6.0
//        scatterRenderableSeries.pointMarker = marker
//        scatterRenderableSeries.opacity = 0.8
        
        chart.renderableSeries.add(lineRenderableSeries)
        chart.renderableSeries.add(scatterRenderableSeries)
    }
}
