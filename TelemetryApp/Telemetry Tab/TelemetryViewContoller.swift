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

class TelemetryViewController: BaseChartViewController, TelemetryDelegate, UIPopoverPresentationControllerDelegate{
    
    //We need to change this so that charts maintains order with favorites and general
    //Ideally I think this should be to arrays that have matching orders to the above arrays
    var graphingQueues: [DispatchQueue] = []
    var queueIndex = 0 {
        didSet {
            if self.queueIndex == self.numThreads {
                self.queueIndex = 0
            }
        }
    }
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
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var settingButton: UIButton!
    
    var panGesture = UIPanGestureRecognizer()
    var settingsBlur: UIVisualEffectView?
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
//
//        updateChartData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Telemetry.shared.delegate = self
        
//        updateChartData()
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
            
                for chart in Telemetry.shared.generalCharts where chart.key == key {
                    
                    graphingQueues[queueIndex].sync {
                        chart.scatterDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(dataPoint.value))
                        let avgPoint = SciChartRollingAverageUtils.computeRollingAverageForDataPoint(chart: chart, point: dataPoint)
                        chart.lineDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(avgPoint))
                        
                        let maxIndex = chart.lineDataSeries.count() - 1
                        
                        let max = SCIGenericDouble(chart.lineDataSeries.xValues().value(at: maxIndex))
                        
                        let visibleRange = chart.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
                        
                        visibleRange.min = SCIGeneric(dataPoint.time - chart.secondsInPastToPlot)
                        visibleRange.max = SCIGeneric(dataPoint.time + 1)
                        
                        chart.invalidateElement()
                    }
                    queueIndex += 1
                    
                }
                
                for chart in Telemetry.shared.favoriteCharts where chart.key == key {
                    
                    graphingQueues[queueIndex].sync {
                        chart.scatterDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(dataPoint.value))
                        let avgPoint = SciChartRollingAverageUtils.computeRollingAverageForDataPoint(chart: chart, point: dataPoint)
                        chart.lineDataSeries.appendX(SCIGeneric(dataPoint.time), y: SCIGeneric(avgPoint))
                        
                        let maxIndex = chart.lineDataSeries.count() - 1
                        
                        let max = SCIGenericDouble(chart.lineDataSeries.xValues().value(at: maxIndex))
                        
                        let visibleRange = chart.xAxes.item(at: 0).visibleRange as! SCIDoubleRange
                        
                        visibleRange.min = SCIGeneric(dataPoint.time - chart.secondsInPastToPlot)
                        visibleRange.max = SCIGeneric(dataPoint.time + 1)
                        
                        chart.invalidateElement()
                    }
                    queueIndex += 1
                    
                }
                
//                if abs(now.timeIntervalSince(lastGraphTime)) > chartUpdateFrequency {
//                    updateChartData()
//                    lastGraphTime = now
//                }
 
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
//        userIsScrolling = true
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
//        userIsScrolling = false
//        updateChartData()
//        lastGraphTime = Date()
    }
    
    func newSensor(sensor: Sensor) {
        let chart = SmallTelemetrySciChart(frame: .zero)
        
        chart.initialize(key: sensor.key)
        
        if Telemetry.shared.getGeneralSensors().contains(sensor) {
            Telemetry.shared.generalCharts.append(chart)
        } else {
            Telemetry.shared.favoriteCharts.append(chart)
        }
        
        graphView.reloadData()
    }
    
//    override func updateChartData() {
//
//        if !userIsScrolling {
//
//            for chart in Telemetry.shared.favoriteCharts {
//                graphingQueues[queueIndex].sync {
//                    self.updateChartData(chart: chart)
//                }
//                queueIndex += 1
//                if queueIndex == numThreads {
//                    queueIndex = 0
//                }
//            }
//
//            for chart in Telemetry.shared.generalCharts {
//                graphingQueues[queueIndex].sync {
//                    self.updateChartData(chart: chart)
//                }
//                queueIndex += 1
//                if queueIndex == numThreads {
//                    queueIndex = 0
//                }
//            }
//
//        }
//    }
    @IBAction func showSettings(_ sender: Any) {
        let blurEffect = UIBlurEffect(style: .dark)
        self.settingsBlur = UIVisualEffectView(effect: blurEffect)
        self.settingsBlur!.frame = self.view.frame
        self.view.addSubview(self.settingsBlur!)
        let settingsViewController: SettingsViewController = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        settingsViewController.modalPresentationStyle = .popover
        settingsViewController.modalTransitionStyle = .crossDissolve
    
        let popOverVC = settingsViewController.popoverPresentationController
        popOverVC?.permittedArrowDirections = .up
        popOverVC?.sourceView = self.topView
        popOverVC?.sourceRect = self.settingButton.frame
        settingsViewController.preferredContentSize = CGSize(width: settingsViewController.width, height: settingsViewController.height)
        popOverVC?.delegate = self
        self.present(settingsViewController, animated: true, completion: nil)
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.settingsBlur?.removeFromSuperview()
        }, completion: nil)
        return true
    }
}


