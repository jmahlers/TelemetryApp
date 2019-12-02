//
//  DockManager.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
class DockManager: UIView, TelemetryDelegate{
    
    var minimizedView = DockMinimizedView()
    var expandedView = DockExpandedView()
    var isExpanded = false
    
    func expandDock(time: Double){
        UIView.transition(from: minimizedView, to: expandedView, duration: time, options: .transitionCrossDissolve, completion: nil)
        setUp(expandedView)
        isExpanded = true
    }
    func minimizeDock(time: Double){
        UIView.transition(from: expandedView, to: minimizedView, duration: time, options: .transitionCrossDissolve, completion: nil)
        setUp(minimizedView)
        isExpanded = false
    }
    func setAlpha(_ alpha :CGFloat){
        minimizedView.setAlpha(alpha)
        expandedView.setAlpha(alpha)
    }
    
    func manageMessage(key: String, dataPoint: DataPoint) {
        if(isExpanded){
            expandedView.manageMessage(key: key, dataPoint: dataPoint)
        }else{
            minimizedView.manageMessage(key: key, dataPoint: dataPoint)
        }
    }
    func manageOpen() {
        if(isExpanded){
            expandedView.manageOpen()
        }else{
            minimizedView.manageOpen()
        }
    }
    func manageComplete() {
        if(isExpanded){
            expandedView.manageComplete()
        }else{
            minimizedView.manageComplete()
        }
    }
    func newSensor(sensor: Sensor) {
    }
}


