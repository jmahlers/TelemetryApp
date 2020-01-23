//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import SciChart

class TelemetryViewController : UIViewController, TelemetryDelegate, UIPopoverPresentationControllerDelegate {
    
    var timer: Timer?
    
    let graphUpdatePeriod:Double = 0.1 // in seconds
    var mostRecentTime:Double = 0
    
    @IBOutlet weak var dockOutlet: DockManager!
    @IBOutlet var dockHeight: NSLayoutConstraint!
    @IBOutlet weak var graphView: UICollectionView!
    @IBOutlet weak var dockBlur: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var weatherButton: UIButton!
    
    var panGesture = UIPanGestureRecognizer()
    var settingsBlur: UIVisualEffectView?
    var dockDidTransition = false
    var upwardState = false {
        didSet {
            if self.upwardState {
                graphingPaused = true
            } else {
                graphingPaused = false
            }
        }
    }
    var graphingPaused = false {
        didSet {
            if self.graphingPaused {
                Telemetry.shared.dataToPlot.removeAll()
            } else {
                updateAllChartsWithBufferedData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.dataSource = self
        graphView.delegate = self
        
        dockOutlet.expandedView.expandedDockCollection.dataSource = self
        dockOutlet.expandedView.expandedDockCollection.delegate = self
        
        let cellNib = UINib(nibName: "DockExpandedCell", bundle: nil)
        dockOutlet.expandedView.expandedDockCollection.register(cellNib, forCellWithReuseIdentifier: "DockExpandedCell")
        graphView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "myView")
       let dockHeaderNib = UINib(nibName: "DockHeaderView", bundle: nil)
        dockOutlet.expandedView.expandedDockCollection.register(dockHeaderNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "myDockView")
        dockOutlet.setUp(dockOutlet.minimizedView)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(TelemetryViewController.draggedView(_:)))
                
        dockOutlet.isUserInteractionEnabled = true
        dockOutlet.addGestureRecognizer(panGesture)
        dockOutlet.roundTopCorners(cornerRadius: 12.5)
        
        updateAllChartsWithBufferedData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        graphView.dataSource = self
        graphView.delegate = self
        
        Telemetry.shared.delegate = self
        
        graphView.reloadData()
        dockOutlet.expandedView.expandedDockCollection.reloadData()
        
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: graphUpdatePeriod, repeats: true, block: updateAllChartsWithBufferedData)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
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
            dockOutlet.manageMessage(key: key, dataPoint: dataPoint)
            mostRecentTime = dataPoint.time
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
            Telemetry.shared.generalCharts.sort()
        } else {
            Telemetry.shared.favoriteCharts.append(chart)
            Telemetry.shared.favoriteCharts.sort()
        }
        
        graphView.reloadData()
    }
    
    @IBAction func showSettings(_ sender: Any) {
        let settingsViewController: SettingsModalController = SettingsModalController(nibName: "SettingsModalController", bundle: nil)
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
    @IBAction func showWeather(_ sender: Any) {
        let weatherModalController: WeatherModalController = WeatherModalController(nibName: "WeatherModalController", bundle: nil)
        weatherModalController.modalPresentationStyle = .popover
        weatherModalController.modalTransitionStyle = .crossDissolve
        weatherModalController.fromView = self
        let popOverVC = weatherModalController.popoverPresentationController
        popOverVC?.permittedArrowDirections = .up
        popOverVC?.sourceView = self.topView
        popOverVC?.sourceRect = self.weatherButton.frame
        weatherModalController.preferredContentSize = CGSize(width: weatherModalController.width, height: weatherModalController.height)
        popOverVC?.delegate = self
        self.present(weatherModalController, animated: true, completion: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailLiveGraph" {
            
            let detailLiveGraphVC = segue.destination as? DetailLiveSciChartVC
            let cell = sender as! GraphCollectionViewCell
            //let indexPath = self.graphView.indexPath(for: cell)
            
            if cell.label.text != nil {
                detailLiveGraphVC?.key = cell.label.text!
            }
            
        }else if(segue.identifier == "showWeather"){
            let destinationVC = segue.destination as! WeatherViewController
            let destinationLocation = sender as! String
            destinationVC.location = destinationLocation
        }else if(segue.identifier == "showInProgress"){
        
        }
    }
}


