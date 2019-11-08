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
    
    
    func manageMessage(key: String, dataPoint: DataPoint) {
        

        if (key == chartView.keyToGraph) {
//            var firstTimeEntry = chartView.data?.getDataSetByIndex(0)?.entryForIndex(0)
//            var lastTimeEntry = chartView.data?.getDataSetByIndex(0)?.entryForIndex((chartView.data?.getDataSetByIndex(0)?.entryCount ?? 0) - 1)
//
//            var firstTime = firstTimeEntry?.x
//            var lastTime = lastTimeEntry?.x
            
            
//            if firstTimeEntry != nil && lastTimeEntry != nil {
//                print("difference", firstTime! - lastTime!)
//                while Int(firstTime! - lastTime!) > avgPeriod {
//                    print("difference", firstTime! - lastTime!)
//                    chartView.data?.removeEntry(lastTimeEntry!, dataSetIndex: 0)
//                    chartView.data?.removeEntry(lastTimeEntry!, dataSetIndex: 1)
//                    
////                    chartView.data?.getDataSetByIndex(1)?.removeEntry(index: 0)
//                    
//                    firstTime = chartView.data?.getDataSetByIndex(0)?.entryForIndex(0)?.x
//                    lastTime = chartView.data?.getDataSetByIndex((chartView.data?.getDataSetByIndex(0)?.entryCount ?? 0) - 1)?.entryForIndex(0)?.x
//                }
//            }
//            chartView.notifyDataSetChanged()

            
            let entry: ChartDataEntry = ChartDataEntry(x: dataPoint.time, y: Double(dataPoint.value))
            chartView.data?.addEntry(entry, dataSetIndex: 0)
            chartView.xAxis.axisMaximum = dataPoint.time + (chartView.xAxis.axisRange * 0.1)
            chartView.moveViewToX(dataPoint.time + (chartView.xAxis.axisRange * 0.1))

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
        
//        chartView.chartDescription?.enabled = false
//        chartView.dragEnabled = true
//        chartView.setScaleEnabled(true)
//        chartView.pinchZoomEnabled = true
        // x-axis limit line
//        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
//        llXAxis.lineWidth = 4
//        llXAxis.lineDashLengths = [10, 10, 0]
//        llXAxis.labelPosition = .bottomRight
//        llXAxis.valueFont = .systemFont(ofSize: 10)
        
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0
        
        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
//        leftAxis.axisMaximum = 100
//        leftAxis.axisMinimum = -50
        leftAxis.gridLineDashLengths = [5, 5]
//        leftAxis.drawLimitLinesBehindDataEnabled = true
        
        chartView.rightAxis.enabled = false
        
        //[_chartView.viewPortHandler setMaximumScaleY: 2.f];
        //[_chartView.viewPortHandler setMaximumScaleX: 2.f];
        
//        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
//                                   font: .systemFont(ofSize: 12),
//                                   textColor: .white,
//                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
//        marker.chartView = chartView
//        marker.minimumSize = CGSize(width: 80, height: 40)
//        chartView.marker = marker
        
//        chartView.legend.form = .line
        
//        chartView.animate(xAxisDuration: 0)
        
        
        Telemetry.shared.delegate = self
        
        
        updateChartData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Telemetry.shared.delegate = self

        updateChartData()
    }
    
    override func updateChartData() {
        guard let points = Telemetry.shared.dataSource[Sensor(key: "FrontRightBrakeTemp", unit: nil, description: nil, system: nil)] else {
            print("data couldn't be accessed from telemetry data source (it probably doesn't exist)")
            return
        }
        
        
        let pointsFromLastNSecondsSlice = points.suffix(Int(TelemetryLineChartView.frequency * chartView.secondsInPastToPlot))
        
        let pointsFromLastNSeconds = Array(pointsFromLastNSecondsSlice)
        
        var entries:[ChartDataEntry] = []
        let rollingAvgEntries:[ChartDataEntry] = computeRollingAverageEntriesForDataSet(points: pointsFromLastNSeconds)
        
        for point in pointsFromLastNSeconds {
            let entry:ChartDataEntry = ChartDataEntry(x: point.time, y: Double(point.value))
            entries.append(entry)
        }
        
        
        let set1 = LineChartDataSet(entries: entries, label: chartView.keyToGraph)
        set1.drawIconsEnabled = false
        
        set1.lineDashLengths = [5, 0]
        set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(.black)
        set1.setCircleColor(.black)
        set1.lineWidth = 0
        set1.circleRadius = 1.2
        set1.drawValuesEnabled = false
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineDashLengths = [5, 2.5]
        set1.formLineWidth = 1
        set1.formSize = 15
        set1.mode = .cubicBezier
        

        
        
        let set2 = LineChartDataSet(entries: rollingAvgEntries, label: "Rolling Average")
        set2.drawIconsEnabled = false
        set2.mode = .cubicBezier
        set2.lineDashLengths = [5, 0]
        set2.highlightLineDashLengths = [5, 2.5]
        set2.setColor(.blue)
        //set1.setCircleColor(.black)
        set2.lineWidth = 2
        set2.circleRadius = 0
        set2.drawValuesEnabled = false
        set2.drawCircleHoleEnabled = false
        set2.valueFont = .systemFont(ofSize: 9)
        set2.formLineDashLengths = [5, 2.5]
        set2.formLineWidth = 1
        set2.formSize = 15
        
        let gradientColors2 = [ChartColorTemplates.colorFromString("#00add8e6").cgColor,
                               ChartColorTemplates.colorFromString("#ffadd8e6").cgColor]
        let gradient2 = CGGradient(colorsSpace: nil, colors: gradientColors2 as CFArray, locations: nil)!
        
        set2.fillAlpha = 1
        set2.fill = Fill(linearGradient: gradient2, angle: 90) //.linearGradient(gradient, angle: 90)
        set2.drawFilledEnabled = true
        let chartData = LineChartData(dataSets: [set1, set2])
        
        chartView.data = chartData
        
    }
    
    
    func computeRollingAverageForDataPoint(point: DataPoint) -> ChartDataEntry {
        if rollAvgStorage.count < avgPeriod {
            rollAvgStorage.append(point.value)
        } else {
            rollAvgStorage[rollingIndex] = point.value
        }
        
        var sum = 0.0
        for value in rollAvgStorage {
            sum += Double(value)
        }
        
        let currAvg = sum/Double(rollAvgStorage.count)
        
        let entry = ChartDataEntry(x: point.time, y: currAvg)
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
            
            var sum = 0.0
            for value in rollAvgStorage {
                sum += Double(value)
            }

            let currAvg = sum/Double(rollAvgStorage.count)
            rollAvgEntries.append(ChartDataEntry(x: points[i].time, y: currAvg))
            rollingIndex += 1
            if i % rollAvgStorage.count == 0 {
                rollingIndex = 0
            }
        }
        
        return rollAvgEntries
    }

}
