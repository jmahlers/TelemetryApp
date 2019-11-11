//
//  ChartSetUpUtils.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/10/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import SciChart

extension TelemetryViewController {
    
    func setUpSmallChart() {
        let chart = SmallTelemetrySciChart(frame: .zero)
        chart.translatesAutoresizingMaskIntoConstraints = true
        // Set the autoResizingMask property so the chart will fit the screen when we rotate the device
        chart.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        chart.xAxes.add(xAxis)
        
        let yAxis = SCINumericAxis()
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        chart.yAxes.add(yAxis)
        yAxis.autoRange = .always
        
        createDataSeries(chart: chart)
        createRenderableSeries(chart: chart)
        addModifiers(chart: chart)
    }
    
    func setUpDetailChart() {
        
    }
    
    func addModifiers(chart: SmallTelemetrySciChart){
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

        chart.chartModifiers = groupModifier
    }
    
    func createDataSeries(chart: SmallTelemetrySciChart) {
        // Init line data series
        chart.lineDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        chart.lineDataSeries.fifoCapacity = 500
        chart.lineDataSeries.seriesName = "line series"
        
        // Init scatter data series
        chart.scatterDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        chart.scatterDataSeries.fifoCapacity = 500
        chart.scatterDataSeries.seriesName = "scatter series"
        
        guard let points = Telemetry.shared.dataSource[Sensor(key: "FrontRightBrakeTemp")] else {
            print("Data couldn't be accessed from telemetry data source (it probably doesn't exist)")
            return
        }
        
        for point in points {
            chart.lineDataSeries.appendX(SCIGeneric(point.time), y: SCIGeneric(point.value))
            //scatterDataSeries.appendX(SCIGeneric(i), y: SCIGeneric(cos(Double(i)*0.1)))
        }
    }
    
    func createRenderableSeries(chart: SmallTelemetrySciChart){
        chart.lineRenderableSeries = SCIFastLineRenderableSeries()
        chart.lineRenderableSeries.dataSeries = chart.lineDataSeries
        
        chart.scatterRenderableSeries = SCIXyScatterRenderableSeries()
        chart.scatterRenderableSeries.dataSeries = chart.scatterDataSeries
        
        chart.renderableSeries.add(chart.lineRenderableSeries)
        chart.renderableSeries.add(chart.scatterRenderableSeries)
    }
    
}
