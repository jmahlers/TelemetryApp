//
//  ContainerController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    @IBOutlet weak var TelemetryGraphView: UIView!
    @IBOutlet weak var TelemetryDockView: UIView!
    
    var panGesture = UIPanGestureRecognizer()
    var test = UIPanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(ContainerController.draggedView(_:)))
        TelemetryDockView.isUserInteractionEnabled = true
        TelemetryDockView.addGestureRecognizer(panGesture)
    }

    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(TelemetryDockView)
        let translation = sender.translation(in: self.view)
        TelemetryDockView.center = CGPoint(x: TelemetryDockView.center.x + translation.x, y: TelemetryDockView.center.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
}
