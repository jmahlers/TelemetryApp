//
//  ContainerController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    

    @IBOutlet weak var GraphView: UIView!
    @IBOutlet weak var DockView: UIView!
    @IBOutlet weak var DockHeight: NSLayoutConstraint!
    
    var panGesture = UIPanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(ContainerController.draggedView(_:)))
        DockView.isUserInteractionEnabled = true
        DockView.addGestureRecognizer(panGesture)
    }

    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(DockView)
        let translation = sender.translation(in: self.view)
        DockHeight.constant -= translation.y
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
}
