//
//  DockView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
class DockMinimizedView: UIView, TelemetryDelegate{

    
    
    @IBOutlet var label: UILabel!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("DockMinimizedView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func manageMessage(key: String, dataPoint: DataPoint) {
    }
    
    func manageOpen() {
    }
    
    func manageComplete() {
    }
    func newSensor(sensor: Sensor) {
    }
}
