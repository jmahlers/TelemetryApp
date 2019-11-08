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
    
    var rollAvgStorage: [Float] = []
    let avgPeriod = 10
    var rollingIndex = 0
    var currTime = 0.0
    
    func manageMessage(key: String, dataPoint: DataPoint) {
        if (key == chartView.keyToGraph) {

            let entry: ChartDataEntry = ChartDataEntry(x: currTime, y: Double(dataPoint.value))
            chartView.data?.addEntry(entry, dataSetIndex: 0)
            chartView.xAxis.axisMaximum = currTime + (chartView.xAxis.axisRange * 0.1)
            chartView.moveViewToX(currTime + (chartView.xAxis.axisRange * 0.1))
            incrementCurrTime()

            let rollingAvgEntry: ChartDataEntry = computeRollingAverageForDataPoint(point: dataPoint)
            chartView.data?.addEntry(rollingAvgEntry, dataSetIndex: 1)
            
            chartView.notifyDataSetChanged()
        }
    }
    
    func manageOpen() {
        
    }
    
    func manageComplete() {
        
    }
    
    @IBOutlet weak var chartView: TelemetryLineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.chartView.keyToGraph = "FrontRightBrakeTemp"
        
        // Do any additional setup after loading the view.
        self.options = [.toggleValues,
                        .toggleFilled,
                        .toggleCircles,
                        .toggleCubic,
                        .toggleHorizontalCubic,
                        .toggleIcons,
                        .toggleStepped,
                        .toggleHighlight,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .saveToGallery,
                        .togglePinchZoom,
                        .toggleAutoScaleMinMax,
                        .toggleData]
        
        chartView.delegate = self
        Telemetry.shared.delegate = self

        chartView.setUpXAxes()
        chartView.setUpYAxes()

        updateChartData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Telemetry.shared.delegate = self

        updateChartData()
    }
    
    override func updateChartData() {
        guard let points = Telemetry.shared.dataSource[Sensor(key: chartView.keyToGraph)] else {
            print("Data couldn't be accessed from telemetry data source (it probably doesn't exist)")
            return
        }
        let nDataPointsToPlot = Int(TelemetryLineChartView.frequency * chartView.secondsInPastToPlot)
        let pointsFromLastNSecondsSlice = points.suffix(nDataPointsToPlot)
        let pointsFromLastNSeconds = Array(pointsFromLastNSecondsSlice)
        
        var rawEntries:[ChartDataEntry] = []
        
        let rollingAvgEntries:[ChartDataEntry] = computeRollingAverageEntriesForDataSet(points: pointsFromLastNSeconds)
        
        var timeCounter:Double = 0
        for point in pointsFromLastNSeconds {
            let entry:ChartDataEntry = ChartDataEntry(x: timeCounter, y: Double(point.value))
            rawEntries.append(entry)
            
            timeCounter += 1 / TelemetryLineChartView.frequency
        }
        
        let rawDataSet = setUpRawDataSet(entries: rawEntries)
        let rollAvgDataSet = setUpRollingAvgDataSet(entries: rollingAvgEntries)
        
        
        let chartData = LineChartData(dataSets: [rawDataSet, rollAvgDataSet])
        
        chartView.data = chartData
        
    }
    
    
    func computeRollingAverageForDataPoint(point: DataPoint) -> ChartDataEntry {
        if rollAvgStorage.count < avgPeriod {
            rollAvgStorage.append(point.value)
        } else {
            rollAvgStorage[rollingIndex] = point.value
        }
        
        let sum = rollAvgStorage.reduce(0) { $0 + $1 }
        let currAvg:Double = Double(sum) / Double(rollAvgStorage.count)
        
        let entry = ChartDataEntry(x: currTime, y: currAvg)
        incrementCurrTime()
        
        
        rollingIndex += 1
        if rollingIndex == rollAvgStorage.count {
            rollingIndex = 0
        }
        
        return entry
    }
    
    func computeRollingAverageEntriesForDataSet(points: [DataPoint]) -> [ChartDataEntry] {
        var rollAvgEntries: [ChartDataEntry] = []

        for i in 0..<points.count {
            if rollAvgStorage.count < avgPeriod {
                rollAvgStorage.append(points[i].value)
            } else {
                rollAvgStorage[rollingIndex] = points[i].value
            }
            
            let sum = rollAvgStorage.reduce(0) { $0 + $1 }
            let currAvg:Double = Double(sum) / Double(rollAvgStorage.count)

            rollAvgEntries.append(ChartDataEntry(x: currTime, y: currAvg))
            incrementCurrTime()
            
            rollingIndex += 1
            if rollingIndex == rollAvgStorage.count {
                rollingIndex = 0
            }
        }
        
        return rollAvgEntries
    }
    
    func setUpRawDataSet(entries: [ChartDataEntry]) -> LineChartDataSet {
        let set = LineChartDataSet(entries: entries, label: chartView.keyToGraph)
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
        set.mode = .cubicBezier
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
    
    func incrementCurrTime() {
        currTime += 1 / TelemetryLineChartView.frequency
    }

}
