//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import Charts
import SciChart

class TelemetryViewController: BaseChartViewController, TelemetryDelegate{
    
    //We need to change this so that charts maintains order with favorites and general
    //Ideally I think this should be to arrays that have matching orders to the above arrays

    
    var graphingQueues: [DispatchQueue] = []
    var queueIndex = 0
    let numThreads = 12
//    let graphingQueue = DispatchQueue(label: "graphingQueue", qos: .background, attributes: .concurrent)

 
    let chartUpdateFrequency: Double = 0.5 // seconds
    var lastGraphTime: Date = Date()
    var lastDockTime: Date = Date()
    
    var userIsScrolling = false
    
    @IBOutlet weak var dockOutlet: DockManager!
    @IBOutlet var dockHeight: NSLayoutConstraint!
    @IBOutlet weak var graphView: UICollectionView!
    @IBOutlet weak var dockBlur: UIView!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    
    var panGesture = UIPanGestureRecognizer()
    var upwardState = false
    var dockDidTransition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.dataSource = self
        graphView.delegate = self
        dockOutlet.expandedView.expandedDockCollection.dataSource = self
        dockOutlet.expandedView.expandedDockCollection.delegate = self
        
        let cellNib = UINib(nibName: "DockExpandedCell", bundle: nil)
        dockOutlet.expandedView.expandedDockCollection.register(cellNib, forCellWithReuseIdentifier: "DockExpandedCell")
        graphView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "myView")
        dockOutlet.expandedView.expandedDockCollection.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "myView")
        dockOutlet.setUp(dockOutlet.minimizedView)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(TelemetryViewController.draggedView(_:)))
        
        dockOutlet.isUserInteractionEnabled = true
        dockOutlet.addGestureRecognizer(panGesture)
        dockOutlet.roundTopCorners(cornerRadius: 12.5)
        
        for i in 0..<numThreads {
            graphingQueues.append(DispatchQueue(label: "graphingQueue"+String(i), qos: .background, attributes: .concurrent))
        }
        
        updateChartData()
        
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
       
        let now = Date()
        if(upwardState){
            UIView.performWithoutAnimation {
                 dockOutlet.expandedView.expandedDockCollection.reloadItems(at: [indexPath])
            }
        }else{
            UIView.performWithoutAnimation {
            
                if abs(now.timeIntervalSince(lastGraphTime)) > chartUpdateFrequency {
                    updateChartData()
                    lastGraphTime = now
                }
 
           //     let chart = (section == 0 ? Telemetry.shared.favoriteCharts[row] : Telemetry.shared.generalCharts[row])
              //  self.updateChartData(chart: chart)
            }
           
        }
    }
    func manageOpen() {
        
    }
    
    func manageComplete() {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        userIsScrolling = true
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        userIsScrolling = false
        updateChartData()
        lastGraphTime = Date()
    }
    
    func newSensor(sensor: Sensor) {
        let chart = SmallTelemetryChartView(frame: .zero)
        chart.setUp(key: sensor.key)
        chart.delegate = self
        updateChartData(chart: chart)
        if Telemetry.shared.getGeneralSensors().contains(sensor) {
            Telemetry.shared.generalCharts.append(chart)
        } else {
            Telemetry.shared.favoriteCharts.append(chart)
        }
        graphView.reloadData()
    }
    
    override func updateChartData() {
        
        if !userIsScrolling {
        
            for chart in Telemetry.shared.favoriteCharts {
                graphingQueues[queueIndex].sync {
                    self.updateChartData(chart: chart)
                }
                queueIndex += 1
                if queueIndex == numThreads {
                    queueIndex = 0
                }
            }
            
            for chart in Telemetry.shared.generalCharts {
                graphingQueues[queueIndex].sync {
                    self.updateChartData(chart: chart)
                }
                queueIndex += 1
                if queueIndex == numThreads {
                    queueIndex = 0
                }
            }
        
        }
    }
}


