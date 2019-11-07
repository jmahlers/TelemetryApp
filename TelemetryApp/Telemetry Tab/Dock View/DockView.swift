//
//  DockView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
///A template so that both DockMinimized and DockExpanded inherit TelemetryDelegate
class DockView: UIView, TelemetryDelegate{
    func manageMessage(_ event: SensorReading) {
    }
    
    func manageOpen() {
    }
    
    func manageComplete() {
    }
}
