//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import Charts

class TelemetryViewController: BaseChartViewController, TelemetryDelegate {
    
    var charts: [SmallTelemetryChartView] = []
    
    let graphingQueue = DispatchQueue(label: "graphingQueue", qos: .background, attributes: .concurrent)

    
    @IBOutlet weak var dockOutlet: DockManager!
    @IBOutlet var dockHeight: NSLayoutConstraint!
    @IBOutlet weak var graphView: UICollectionView!
    @IBOutlet weak var dockBlur: UIView!
    
    var panGesture = UIPanGestureRecognizer()
    var upwardState = false
    var headerHeight:CGFloat = 50
    //var headerView = HeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.dataSource = self
        dockOutlet.setUp(dockOutlet.minimizedView)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(TelemetryViewController.draggedView(_:)))
        DockOutlet.isUserInteractionEnabled = true
        DockOutlet.addGestureRecognizer(panGesture)
        DockOutlet.roundCorners(cornerRadius: 12.5)
        
        var counter = 100
        for sensor in Telemetry.shared.getGeneralSensors() {
            let chart = SmallTelemetryChartView(frame: CGRect(x: 10, y: counter, width: 400, height: 100))
            chart.setUp(key: sensor.key)
            chart.delegate = self
            charts.append(chart)
            counter += 110
        }
        
        Telemetry.shared.delegate = self
        
    }
    
    
    func manageMessage(key: String, dataPoint: DataPoint) {
        
        graphingQueue.sync {
            for chart in self.charts where chart.keyToGraph == key {
                
                let entry: ChartDataEntry = ChartDataEntry(x: dataPoint.time, y: Double(dataPoint.value))
                chart.data?.addEntry(entry, dataSetIndex: 0)
                
                chart.xAxis.axisMaximum = dataPoint.time + (chart.xAxis.axisRange * 0.2)
                chart.xAxis.axisMinimum = dataPoint.time - chart.secondsInPastToPlot
                chart.moveViewToX(dataPoint.time + (chart.xAxis.axisRange * 0.2))
                
                let rollingAvgEntry: ChartDataEntry = self.computeRollingAverageForDataPoint(chart: chart, point: dataPoint)
                chart.data?.addEntry(rollingAvgEntry, dataSetIndex: 1)
                
                chart.notifyDataSetChanged()
                
            }
        }
        
        
    }
    
    func manageOpen() {
        
    }
    
    func manageComplete() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Telemetry.shared.delegate = self
        
        updateChartData()
    }
    
    override func updateChartData() {
        graphingQueue.sync {
            self.charts.forEach {chart in
                self.updateChartData(chart: chart)
            }
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
    
    
    
    
   
    
}


