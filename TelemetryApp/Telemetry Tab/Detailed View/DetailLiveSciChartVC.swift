//
//  DetailLiveSciChartVC.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/13/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import SciChart

class DetailLiveSciChartVC : UIViewController, TelemetryDelegate {
    
    var key: String?
    var graph: DetailLiveSciChart?
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var detailGraphContainer: UIView!
    
    func manageMessage(key: String, dataPoint: DataPoint) {
        if key == self.key {
            graph?.appendDataPointToDataSeries(dataPoint: dataPoint)
        }
    }
    
    func manageOpen() {
    
    }
    
    func manageComplete() {
        
    }
    
    func newSensor(sensor: Sensor) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graph = DetailLiveSciChart(frame: self.detailGraphContainer!.frame)
        graph!.initialize(key: key!)
        self.detailGraphContainer.addSubview(graph!)
        
        label.text = key
        
        Telemetry.shared.delegate = self
        
        updateChartWithData()
    }
    
    func updateChartWithData() {
        
    }
    
}
