//
//  LineChart1ViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: BaseChartViewController, TelemetryDelegate {
    
    var charts: [SmallTelemetryChartView] = []
    
    func manageMessage(key: String, dataPoint: DataPoint) {
        
        for chart in charts where chart.keyToGraph == key {

            let entry: ChartDataEntry = ChartDataEntry(x: dataPoint.time, y: Double(dataPoint.value))
            chart.data?.addEntry(entry, dataSetIndex: 0)
            
            chart.xAxis.axisMaximum = dataPoint.time + (chart.xAxis.axisRange * 0.2)
            chart.xAxis.axisMinimum = dataPoint.time - chart.secondsInPastToPlot
            chart.moveViewToX(dataPoint.time + (chart.xAxis.axisRange * 0.2))
            
            let rollingAvgEntry: ChartDataEntry = computeRollingAverageForDataPoint(chart: chart, point: dataPoint)
            chart.data?.addEntry(rollingAvgEntry, dataSetIndex: 1)

            chart.notifyDataSetChanged()
            
        }
        
    }
    
    func manageOpen() {
        
    }
    
    func manageComplete() {
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        var counter = 100
        for sensor in Telemetry.shared.getGeneralSensors() {
            let chart = SmallTelemetryChartView(frame: CGRect(x: 10, y: counter, width: 400, height: 100))
            chart.setUp(key: sensor.key)
            chart.delegate = self
            charts.append(chart)
            self.view.addSubview(chart)
            counter += 110
        }
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Telemetry.shared.delegate = self

        updateChartData()
    }
    
    override func updateChartData() {
        charts.forEach {chart in
            updateChartData(chart: chart)
        }
    }
    
    func updateChartData(chart: SmallTelemetryChartView) {
        guard let points = Telemetry.shared.dataSource[Sensor(key: chart.keyToGraph)] else {
            print("Data couldn't be accessed from telemetry data source (it probably doesn't exist)")
            return
        }
        
        var rawEntries:[ChartDataEntry] = []
        
        let rollingAvgEntries:[ChartDataEntry] = computeRollingAverageEntriesForDataSet(chart: chart, points: points)
        
        for point in points {
            let entry:ChartDataEntry = ChartDataEntry(x: point.time, y: Double(point.value))
            rawEntries.append(entry)
        }
        
        let rawDataSet = setUpRawDataSet(chart: chart, entries: rawEntries)
        let rollAvgDataSet = setUpRollingAvgDataSet(entries: rollingAvgEntries)
        
        
        let chartData = LineChartData(dataSets: [rawDataSet, rollAvgDataSet])
        
        chart.data = chartData
    }
    
    
    func computeRollingAverageForDataPoint(chart: SmallTelemetryChartView, point: DataPoint) -> ChartDataEntry {
        
        if chart.rollAvgStorage.count < chart.avgPeriod {
            chart.rollAvgStorage.append(point.value)
        } else {
            chart.rollAvgStorage[chart.rollingIndex] = point.value
        }
        
        let sum = chart.rollAvgStorage.reduce(0) { $0 + $1 }
        let currAvg:Double = Double(sum) / Double(chart.rollAvgStorage.count)
        
        let entry = ChartDataEntry(x: point.time, y: currAvg)
        
        chart.rollingIndex += 1
        if chart.rollingIndex == chart.rollAvgStorage.count {
            chart.rollingIndex = 0
        }
        
        return entry
    }
    
    func computeRollingAverageEntriesForDataSet(chart: SmallTelemetryChartView, points: [DataPoint]) -> [ChartDataEntry] {
        chart.rollingIndex = 0
        chart.rollAvgStorage.removeAll()
        
        var rollAvgEntries: [ChartDataEntry] = []

        for i in 0..<points.count {
            if chart.rollAvgStorage.count < chart.avgPeriod {
                chart.rollAvgStorage.append(points[i].value)
            } else {
                chart.rollAvgStorage[chart.rollingIndex] = points[i].value
            }
            
            let sum = chart.rollAvgStorage.reduce(0) { $0 + $1 }
            let currAvg:Double = Double(sum) / Double(chart.rollAvgStorage.count)

            rollAvgEntries.append(ChartDataEntry(x: points[i].time, y: currAvg))
            
            chart.rollingIndex += 1
            if chart.rollingIndex == chart.rollAvgStorage.count {
                chart.rollingIndex = 0
            }
        }
        
        return rollAvgEntries
    }
    
    func setUpRawDataSet(chart: SmallTelemetryChartView, entries: [ChartDataEntry]) -> LineChartDataSet {
        let set = LineChartDataSet(entries: entries, label: chart.keyToGraph)
        set.drawIconsEnabled = false
        set.lineDashLengths = [5, 0]
        set.highlightLineDashLengths = [5, 2.5]
        set.setColor(.black)
        set.setCircleColor(.black)
        set.lineWidth = 0
        set.circleRadius = 1.2
        set.drawValuesEnabled = false
        set.drawCircleHoleEnabled = false
        set.valueFont = .systemFont(ofSize: 9)
        set.formLineDashLengths = [5, 2.5]
        set.formLineWidth = 1
        set.formSize = 15
        set.mode = .cubicBezier
        return set
    }
    
    func setUpRollingAvgDataSet(entries: [ChartDataEntry]) -> LineChartDataSet {
        let set = LineChartDataSet(entries: entries, label: "Rolling Average")
        set.drawIconsEnabled = false
//        set.mode = .cubicBezier
        set.lineDashLengths = [5, 0]
        set.highlightLineDashLengths = [5, 2.5]
        set.setColor(.blue)
        //set1.setCircleColor(.black)
        set.lineWidth = 2
        set.circleRadius = 0
        set.drawValuesEnabled = false
        set.drawCircleHoleEnabled = false
        set.valueFont = .systemFont(ofSize: 9)
        set.formLineDashLengths = [5, 2.5]
        set.formLineWidth = 1
        set.formSize = 15
        
        let gradientColors2 = [ChartColorTemplates.colorFromString("#00add8e6").cgColor,
                               ChartColorTemplates.colorFromString("#ffadd8e6").cgColor]
        let gradient2 = CGGradient(colorsSpace: nil, colors: gradientColors2 as CFArray, locations: nil)!
        
        set.fillAlpha = 1
        set.fill = Fill(linearGradient: gradient2, angle: 90) //.linearGradient(gradient, angle: 90)
        set.drawFilledEnabled = true
        return set
    }
    
}
