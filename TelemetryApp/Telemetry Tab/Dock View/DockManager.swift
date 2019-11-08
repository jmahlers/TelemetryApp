//
//  DockManager.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
class DockManager: UIView, TelemetryDelegate{
    
    //var currentView:DockView = DockMinimizedView()
    var minimizedView = DockMinimizedView()
    var expandedView = DockExpandedView()
    var isExpanded = false
    func expandDock(){
        minimizedView.removeFromSuperview()
        setUp(expandedView)
        isExpanded = true
    }
    func minimizeDock(){
        expandedView.removeFromSuperview()
        setUp(minimizedView)
        isExpanded = false
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
}


