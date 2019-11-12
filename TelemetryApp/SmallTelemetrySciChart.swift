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
        
        self.translatesAutoresizingMaskIntoConstraints = true
        // Set the autoResizingMask property so the chart will fit the screen when we rotate the device
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        self.xAxes.add(xAxis)
    
        let yAxis = SCINumericAxis()
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        self.yAxes.add(yAxis)
        yAxis.autoRange = .always
    
        createDataSeries()
        createRenderableSeries()
        addModifiers()
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
    
    private func createDataSeries(){
        // Init line data series
        lineDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        lineDataSeries.fifoCapacity = Int32(self.secondsInPastToPlot*SmallTelemetrySciChart.frequency+Double(self.rollAvgStorage.count))
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
        let recentPoints:[DataPoint] = points.suffix(suffixLength ?? Int(self.secondsInPastToPlot*SmallTelemetrySciChart.frequency))
        
        for point in recentPoints {
            scatterDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            let avgPoint = SciChartRollingAverageUtils.computeRollingAverageForDataPoint(chart: self, point: point)
            lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(avgPoint))
        }
        
    }
    
    private func createRenderableSeries(){
        lineRenderableSeries = SCIFastLineRenderableSeries()
        lineRenderableSeries.dataSeries = lineDataSeries
        
        scatterRenderableSeries = SCIXyScatterRenderableSeries()
        scatterRenderableSeries.dataSeries = scatterDataSeries
        
        self.renderableSeries.add(lineRenderableSeries)
        self.renderableSeries.add(scatterRenderableSeries)
    }
}
