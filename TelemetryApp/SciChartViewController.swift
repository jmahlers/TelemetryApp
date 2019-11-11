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
        i += 1
        
        // appending new data points into the line and scatter data series
        lineDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(dataPoint.value))
        //scatterDataSeries.appendX(SCIGeneric(i), y: SCIGeneric(cos(Double(i)*0.1 + phase)))
        
        phase += 0.01
        
        let minIndex = lineDataSeries.count() - Int32(totalCapacity)
        let maxIndex = lineDataSeries.count() - 1
        
        let max = SCIGenericDouble(lineDataSeries.xValues().value(at: maxIndex))
        let min = SCIGenericDouble(lineDataSeries.xValues().value(at: minIndex))
        
        let visibleRange = sciChartSurface!.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
        let vMin = SCIGenericDouble(visibleRange.min) + 1.0
        let vMax = SCIGenericDouble(visibleRange.max) + totalCapacity * 0.1 + 1.0
        
        // calculating new visible range to simulate the auto scrolling functionality
        if vMin < min && vMax > max{
            visibleRange.min = SCIGeneric(SCIGenericDouble(visibleRange.min) + 1.0)
            visibleRange.max = SCIGeneric(SCIGenericDouble(visibleRange.max) + 1.0)
        }
        
        // as usual - DON'T  forget to call invalidateElement method to update the visual part of SciChart
        sciChartSurface?.invalidateElement()
    }
    
    func manageOpen() {
        
    }
    
    func manageComplete() {
        
    }
    
    func newSensor(sensor: Sensor) {
        
    }
    
    var sciChartSurface: SCIChartSurface?
    
    var lineDataSeries: SCIXyDataSeries!
    var scatterDataSeries: SCIXyDataSeries!
    
    var lineRenderableSeries: SCIFastLineRenderableSeries!
    var scatterRenderableSeries: SCIXyScatterRenderableSeries!
    
    var timer: Timer?
    var phase = 0.0
    
    var i: Int = 0
    var totalCapacity: Double = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sciChartSurface = SCIChartSurface(frame: self.view.bounds)
        sciChartSurface?.translatesAutoresizingMaskIntoConstraints = true
        // Set the autoResizingMask property so the chart will fit the screen when we rotate the device
        sciChartSurface?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(sciChartSurface!)
        
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        sciChartSurface?.xAxes.add(xAxis)
        
        let yAxis = SCINumericAxis()
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        sciChartSurface?.yAxes.add(yAxis)
        yAxis.autoRange = .always
        
        createDataSeries()
        createRenderableSeries()
        addModifiers()
        
        Telemetry.shared.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        if nil == timer{
//            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updatingDataPoints)
//        }
        
        Telemetry.shared.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if nil != timer{
            timer?.invalidate()
            timer = nil
        }
    }
    
    func addModifiers(){
        let xAxisDragmodifier = SCIXAxisDragModifier()
        xAxisDragmodifier.dragMode = .pan
        xAxisDragmodifier.clipModeX = .none
        
        let yAxisDragmodifier = SCIYAxisDragModifier()
        yAxisDragmodifier.dragMode = .pan
        
        let extendZoomModifier = SCIZoomExtentsModifier()
        let pinchZoomModifier = SCIPinchZoomModifier()
        
        let rolloverModifier = SCIRolloverModifier()
        let legend = SCILegendModifier()
        
        let groupModifier = SCIChartModifierCollection(childModifiers: [xAxisDragmodifier, yAxisDragmodifier, pinchZoomModifier, extendZoomModifier, legend, rolloverModifier])
        
        sciChartSurface?.chartModifiers = groupModifier
    }
    
    func updatingDataPoints(timer:Timer){
        
        i += 1
        
        // appending new data points into the line and scatter data series
        lineDataSeries.appendX(SCIGeneric(i), y: SCIGeneric(sin(Double(i)*0.1 + phase)))
        scatterDataSeries.appendX(SCIGeneric(i), y: SCIGeneric(cos(Double(i)*0.1 + phase)))
        
        phase += 0.01
        
        let minIndex = lineDataSeries.count() - Int32(totalCapacity)
        let maxIndex = lineDataSeries.count() - 1
        
        let max = SCIGenericDouble(lineDataSeries.xValues().value(at: maxIndex))
        let min = SCIGenericDouble(lineDataSeries.xValues().value(at: minIndex))
        
        let visibleRange = sciChartSurface!.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
        let vMin = SCIGenericDouble(visibleRange.min) + 1.0
        let vMax = SCIGenericDouble(visibleRange.max) + totalCapacity * 0.1 + 1.0
        
        // calculating new visible range to simulate the auto scrolling functionality
        if vMin < min && vMax > max{
            visibleRange.min = SCIGeneric(SCIGenericDouble(visibleRange.min) + 1.0)
            visibleRange.max = SCIGeneric(SCIGenericDouble(visibleRange.max) + 1.0)
        }
        
        // as usual - DON'T  forget to call invalidateElement method to update the visual part of SciChart
        sciChartSurface?.invalidateElement()
    }
    
    func createDataSeries(){
        // Init line data series
        lineDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        lineDataSeries.fifoCapacity = 500
        lineDataSeries.seriesName = "line series"
        
        // Init scatter data series
        scatterDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        scatterDataSeries.fifoCapacity = 500
        scatterDataSeries.seriesName = "scatter series"
        
        guard let points = Telemetry.shared.dataSource[Sensor(key: "FrontRightBrakeTemp")] else {
            print("Data couldn't be accessed from telemetry data source (it probably doesn't exist)")
            return
        }
        
        for point in points {
            lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            //scatterDataSeries.appendX(SCIGeneric(i), y: SCIGeneric(cos(Double(i)*0.1)))
        }
        
        i = Int(lineDataSeries.count())
    }
    
    func createRenderableSeries(){
        lineRenderableSeries = SCIFastLineRenderableSeries()
        lineRenderableSeries.dataSeries = lineDataSeries
        
        scatterRenderableSeries = SCIXyScatterRenderableSeries()
        scatterRenderableSeries.dataSeries = scatterDataSeries
        
        sciChartSurface?.renderableSeries.add(lineRenderableSeries)
        sciChartSurface?.renderableSeries.add(scatterRenderableSeries)
    }
}
