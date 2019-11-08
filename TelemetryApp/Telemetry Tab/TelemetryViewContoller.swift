//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class TelemetryViewController: UIViewController{
    
    @IBOutlet weak var DockOutlet: DockManager!
    @IBOutlet var dockHeight: NSLayoutConstraint!
    @IBOutlet weak var graphView: UICollectionView!
    
    var panGesture = UIPanGestureRecognizer()
    var upwardState = false
    var headerHeight:CGFloat = 50
    //var headerView = HeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.dataSource = self
        DockOutlet.setUp(DockOutlet.minimizedView)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(TelemetryViewController.draggedView(_:)))
        DockOutlet.isUserInteractionEnabled = true
        DockOutlet.addGestureRecognizer(panGesture)
        DockOutlet.roundCorners(cornerRadius: 12.5)
    }
    
}


