//
//  SciChartViewController.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/10/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class SciChartViewController: UIViewController, TelemetryDelegate {
    func manageMessage(key: String, dataPoint: DataPoint) {
        
        if (key == chart.key) {
//
            scatterDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(dataPoint.value))
            let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: chart, point: dataPoint)
            lineDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(avgPoint))
            
            let minIndex = lineDataSeries.count() - Int32(totalCapacity)
            let maxIndex = lineDataSeries.count() - 1
            
            let max = SCIGenericDouble(lineDataSeries.xValues().value(at: maxIndex))
            let min = SCIGenericDouble(SCIGeneric(max - chart.secondsInPastToPlot))
            
            let visibleRange = chart.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
////            let vMin = SCIGenericDouble(visibleRange.min) + dataPoint.time - chart.secondsInPastToPlot
////            let vMax = SCIGenericDouble(visibleRange.max) + dataPoint.time
//            
//            // calculating new visible range to simulate the auto scrolling functionality
////            if vMin < min && vMax > max{
            visibleRange.min = SCIGeneric(dataPoint.time - chart.secondsInPastToPlot)
            visibleRange.max = SCIGeneric(dataPoint.time + 1)
//            }
            
            // as usual - DON'T  forget to call invalidateElement method to update the visual part of SciChart
            chart.invalidateElement()
        }
    }
    
    func manageOpen() {
        
    }
    
    func manageComplete() {
        
    }
    
    func newSensor(sensor: Sensor) {
        
    }
    
    var chart: SmallTelemetrySciChart!
    
    var lineDataSeries: SCIXyDataSeries!
    var scatterDataSeries: SCIXyDataSeries!
    
    var lineRenderableSeries: SCIFastLineRenderableSeries!
    var scatterRenderableSeries: SCIXyScatterRenderableSeries!
    
    var timer: Timer?

    var totalCapacity: Double = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chart = SmallTelemetrySciChart(frame: self.view.frame)
        
        chart.translatesAutoresizingMaskIntoConstraints = true
        // Set the autoResizingMask property so the chart will fit the screen when we rotate the device
        chart.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(chart)
        
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        chart.xAxes.add(xAxis)
        
        let yAxis = SCINumericAxis()
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        chart.yAxes.add(yAxis)
        yAxis.autoRange = .always
        
        createDataSeries()
        createRenderableSeries()
        addModifiers()
        
        chart.key = "FrontRightBrakeTemp"
        
        Telemetry.shared.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Telemetry.shared.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func addModifiers(){
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
    
    func updatingDataPoints(timer:Timer){
        
//        i += 1
//
//        // appending new data points into the line and scatter data series
//        lineDataSeries.appendX(SCIGeneric(i), y: SCIGeneric(sin(Double(i)*0.1 + phase)))
//        scatterDataSeries.appendX(SCIGeneric(i), y: SCIGeneric(cos(Double(i)*0.1 + phase)))
//
//        phase += 0.01
//
//        let minIndex = lineDataSeries.count() - Int32(totalCapacity)
//        let maxIndex = lineDataSeries.count() - 1
//
//        let max = SCIGenericDouble(lineDataSeries.xValues().value(at: maxIndex))
//        let min = SCIGenericDouble(lineDataSeries.xValues().value(at: minIndex))
        
//        let visibleRange = chart.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
////        let vMin = SCIGenericDouble(visibleRange.min) + 1.0
////        let vMax = SCIGenericDouble(visibleRange.max) + totalCapacity * 0.1 + 1.0
//
//        // calculating new visible range to simulate the auto scrolling functionality
////        if vMin < min && vMax > max{
//            visibleRange.min = SCIGeneric(0)
//        visibleRange.max = SCIGeneric(timer.fireDate.timeIntervalSince(initialized!))
////        }
//        // as usual - DON'T  forget to call invalidateElement method to update the visual part of SciChart
//        chart.invalidateElement()
    }
    
    func createDataSeries(){
        // Init line data series
        lineDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        lineDataSeries.fifoCapacity = Int32(chart.secondsInPastToPlot*SmallTelemetrySciChart.frequency+Double(chart.rollAvgStorage.count))
        lineDataSeries.seriesName = "line series"
        
        // Init scatter data series
        scatterDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        scatterDataSeries.fifoCapacity = 10
        scatterDataSeries.seriesName = "scatter series"
        
        guard let points = Telemetry.shared.dataSource[Sensor(key: chart.key)] else {
            print("Data couldn't be accessed from telemetry data source (it probably doesn't exist)")
            return
        }
        
        let suffixLength = Int("\(chart.lineDataSeries?.fifoCapacity)")
        let recentPoints:[DataPoint] = points.suffix(suffixLength ?? Int(chart.secondsInPastToPlot*SmallTelemetrySciChart.frequency))

        
        for point in recentPoints {
            scatterDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            let avgPoint = RollingAverageUtils.computeRollingAverageForDataPoint(chart: chart, point: point)
            lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(avgPoint))
        }
        
    }
    
    func createRenderableSeries(){
        lineRenderableSeries = SCIFastLineRenderableSeries()
        lineRenderableSeries.dataSeries = lineDataSeries
        
        scatterRenderableSeries = SCIXyScatterRenderableSeries()
        scatterRenderableSeries.dataSeries = scatterDataSeries
        
        chart.renderableSeries.add(lineRenderableSeries)
        chart.renderableSeries.add(scatterRenderableSeries)
    }
}
