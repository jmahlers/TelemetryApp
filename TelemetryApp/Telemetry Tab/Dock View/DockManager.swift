//
//  DockManager.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
class DockManager: UIView, TelemetryDelegate{
    
    var currentView:DockView = DockMinimizedView()
    
    func expandDock(){
        currentView.removeFromSuperview()
        currentView = DockExpandedView()
        setUp(currentView)
    }
    func minimizeDock(){
        currentView.removeFromSuperview()
        currentView = DockMinimizedView()
        setUp(currentView)
    }
    
    func manageMessage(_ event: SensorReading) {
        currentView.manageMessage(event)
    }
    func manageOpen() {
        currentView.manageOpen()
    }
    func manageComplete() {
        currentView.manageComplete()
    }
}

extension UIView{
    func setUp(_ currentView:UIView){
        addSubview(currentView)
        currentView.frame = self.bounds
        currentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
