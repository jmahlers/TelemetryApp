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
    func manageMessage(key: String, dataPoint: DataPoint) {
    }
    
    func manageOpen() {
    }
    
    func manageComplete() {
    }
    func makeOpaque(){
        
    }
}
