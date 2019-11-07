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
        switch sender.state{
        case .changed:
        if(DockHeight.constant >= self.view.bounds.height*0.7){
            let translation = sender.translation(in: self.view)
            if(translation.y > 0){
                DockHeight.constant -= translation.y
            }
            sender.setTranslation(CGPoint.zero, in: self.view)
        }else{
            let translation = sender.translation(in: self.view)
            DockHeight.constant -= translation.y
            
            if(DockHeight.constant >= self.view.bounds.height*0.7){
                DockHeight.constant = self.view.bounds.height*0.7
            }
            sender.setTranslation(CGPoint.zero, in: self.view)
        }
            break
        case .ended:
            self.DockHeight.constant = 0
            UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            break
        default:
            break
        }
    }
    
}
