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
    
    //We need to change this so that charts maintains order with favorites and general
    //Ideally I think this should be to arrays that have matching orders to the above arrays
    var charts: [SmallTelemetryChartView] = []
    
    let graphingQueue = DispatchQueue(label: "graphingQueue", qos: .background, attributes: .concurrent)

    
    @IBOutlet weak var dockOutlet: DockManager!
    @IBOutlet var dockHeight: NSLayoutConstraint!
    @IBOutlet weak var graphView: UICollectionView!
    @IBOutlet weak var dockBlur: UIView!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    
    var panGesture = UIPanGestureRecognizer()
    var upwardState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.dataSource = self
        dockOutlet.expandedView.expandedDockCollection.dataSource = self
        dockOutlet.expandedView.expandedDockCollection.delegate = self
        
        let cellNib = UINib(nibName: "DockExpandedCell", bundle: nil)
        dockOutlet.expandedView.expandedDockCollection.register(cellNib, forCellWithReuseIdentifier: "DockExpandedCell")
        graphView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "myView")
        dockOutlet.setUp(dockOutlet.minimizedView)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(TelemetryViewController.draggedView(_:)))
        dockOutlet.isUserInteractionEnabled = true
        dockOutlet.addGestureRecognizer(panGesture)
        dockOutlet.roundCorners(cornerRadius: 12.5)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Telemetry.shared.delegate = self
        
        updateChartData()
    }
    
    
    func manageMessage(key: String, dataPoint: DataPoint) {
        let sensor = Sensor(key: key)
        let section = (Telemetry.shared.getFavoriteSensors().contains(sensor) ? 0:1)
        let row = (section == 0 ? Telemetry.shared.getFavoriteSensors().firstIndex(of: sensor):Telemetry.shared.getGeneralSensors().firstIndex(of: sensor)) ?? 0
        let indexPath = IndexPath(row: row, section: section)
        
        if(upwardState){
            
            dockOutlet.expandedView.expandedDockCollection.reloadItems(at: [indexPath])
            
        }else{
            //You should call reloadItems() instead of reloading everything.
            graphingQueue.sync {
                //If you make charts two arrays you can do the syntax like above to get the sensor directly rather than searching for it.

                for chart in self.charts where chart.keyToGraph == key {
                    
                    let entry: ChartDataEntry = ChartDataEntry(x: dataPoint.time, y: Double(dataPoint.value))
                    chart.data?.addEntry(entry, dataSetIndex: 0)
                    
                    chart.xAxis.axisMaximum = dataPoint.time + (chart.xAxis.axisRange * 0.2)
                    chart.xAxis.axisMinimum = dataPoint.time - chart.secondsInPastToPlot
                    chart.moveViewToX(dataPoint.time + (chart.xAxis.axisRange * 0.2))
                    
                    let rollingAvgEntry: ChartDataEntry = self.computeRollingAverageForDataPoint(chart: chart, point: dataPoint)
                    chart.data?.addEntry(rollingAvgEntry, dataSetIndex: 1)
                    chart.notifyDataSetChanged()
                    
                    
                    graphView.reloadData()
                }
            }
            
            
        }
    }
    func manageOpen() {
        
    }
    
    func manageComplete() {
        
    }
    
    func newSensor(sensor: Sensor) {
        let chart = SmallTelemetryChartView(frame: .zero)
        chart.setUp(key: sensor.key)
        chart.delegate = self
        charts.append(chart)
        graphView.reloadData()
    }
    
    override func updateChartData() {
        graphingQueue.sync {
            self.charts.forEach {chart in
                self.updateChartData(chart: chart)
            }
        }
    }
}


