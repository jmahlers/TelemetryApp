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

class TelemetryViewController: BaseChartViewController, TelemetryDelegate, UIPopoverPresentationControllerDelegate {
    
    //We need to change this so that charts maintains order with favorites and general
    //Ideally I think this should be to arrays that have matching orders to the above arrays
    var graphingQueues: [DispatchQueue] = []
    let numThreads = 12
    var queueIndex = 0 {
        didSet {
            if self.queueIndex == self.numThreads {
                self.queueIndex = 0
            }
        }
    }
    
    var counter = 0
    
    let graphUpdateFreq = 30 // After this many data points received for given sensor
    let moveAxesPeriod = 30 // After x number of messages received, move all axes to most recent time
    
//    let chartUpdateFrequency: Double = 0.5 // seconds
//    var lastGraphTime: Date = Date()
//    var lastDockTime: Date = Date()
    
    var graphingPaused = false {
        didSet {
            if self.graphingPaused {
                Telemetry.shared.dataToPlot.removeAll()
            } else {
                updateAllChartsWithManyNewMessages()
            }
        }
    }
    
    @IBOutlet weak var dockOutlet: DockManager!
    @IBOutlet var dockHeight: NSLayoutConstraint!
    @IBOutlet weak var graphView: UICollectionView!
    @IBOutlet weak var dockBlur: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var settingButton: UIButton!
    
    var panGesture = UIPanGestureRecognizer()
    var settingsBlur: UIVisualEffectView?
    var upwardState = false {
        didSet {
            if self.upwardState {
                graphingPaused = true
            } else {
                graphingPaused = false
            }
        }
    }
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
            graphingQueues.append(DispatchQueue(label: "graphingQueue"+String(i), qos: .userInteractive, attributes: .concurrent))
        }
        
        updateAllChartsWithManyNewMessages()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Telemetry.shared.delegate = self
        
        updateAllChartsWithManyNewMessages()
    }
    
    var done:Bool = false
    func manageMessage(key: String, dataPoint: DataPoint) {
        let sensor = Sensor(key: key)
        let section = (Telemetry.shared.getFavoriteSensors().contains(sensor) ? 0:1)
        let row = (section == 0 ? Telemetry.shared.getFavoriteSensors().firstIndex(of: sensor):Telemetry.shared.getGeneralSensors().firstIndex(of: sensor)) ?? 0
        let indexPath = IndexPath(row: row, section: section)
        
        if(upwardState) {
            UIView.performWithoutAnimation {
                dockOutlet.expandedView.expandedDockCollection.reloadItems(at: [indexPath])
            }
        } else {
            if (!graphingPaused && Telemetry.shared.dataToPlot[sensor]?.count ?? 0 > graphUpdateFreq) {

                var chart:SmallLiveSciChart?
                if(section == 0) {
                    chart = Telemetry.shared.favoriteCharts[row]
                } else {
                    chart = Telemetry.shared.generalCharts[row]
                }
//                chart?.updateWithManyNewMessages()
//                graphingQueues[queueIndex].sync {
                    chart?.updateWithManyNewMessages()
//                }
//                queueIndex += 1

            }
            
            if counter % moveAxesPeriod == 0 {
                updateVisibleRangeOfEveryGraph(time: dataPoint.time)
            }
            counter += 1
        }
    }
    
    func manageOpen() {
        
    }
    
    func manageComplete() {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        graphingPaused = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        graphingPaused = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (!decelerate) {
            graphingPaused = false
        }
    }
    
    func newSensor(sensor: Sensor) {
        let chart = SmallLiveSciChart(frame: .zero)
        
        chart.initialize(key: sensor.key)
        
        if Telemetry.shared.getGeneralSensors().contains(sensor) {
            Telemetry.shared.generalCharts.append(chart)
        } else {
            Telemetry.shared.favoriteCharts.append(chart)
        }
        
        graphView.reloadData()
    }
    
    @IBAction func showSettings(_ sender: Any) {
//        let blurEffect = UIBlurEffect(style: .light)
//        self.settingsBlur = UIVisualEffectView(effect: blurEffect)
//        self.settingsBlur!.frame = self.view.frame
//        //self.view.addSubview(self.settingsBlur!)
        let settingsViewController: SettingsViewController = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
        settingsViewController.modalPresentationStyle = .popover
        settingsViewController.modalTransitionStyle = .crossDissolve
        settingsViewController.fromView = self
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
        print("dismissed")
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.settingsBlur?.removeFromSuperview()
        }, completion: nil)
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}


