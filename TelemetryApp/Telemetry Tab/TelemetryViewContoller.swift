//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class TelemetryViewController: UIViewController {
    

    @IBOutlet weak var GraphView: UIView!
    @IBOutlet weak var DockOutlet: DockManager!
    @IBOutlet var DockHeight: NSLayoutConstraint!
    
    
    var panGesture = UIPanGestureRecognizer()
    var upwardState = false
    override func viewDidLoad() {
        super.viewDidLoad()
        DockOutlet.setUp(DockOutlet.currentView)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(TelemetryViewController.draggedView(_:)))
        DockOutlet.isUserInteractionEnabled = true
        DockOutlet.addGestureRecognizer(panGesture)
        DockOutlet.roundCorners(cornerRadius: 12.5)
    }
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        switch sender.state{
            
        case .began:
            break
            
        case .changed:
            let translation = sender.translation(in: self.view)
            DockHeight.constant -= translation.y
            sender.setTranslation(CGPoint.zero, in: self.view)
            break
            
        case .ended:
            let inset = view.safeAreaInsets.top + view.safeAreaInsets.bottom
            let upwardHeight = (view.frame.height - inset)*0.93
            if(DockOutlet.bounds.height > 0.3*view.bounds.height && sender.velocity(in: self.view).y<0){
                DockHeight.constant = upwardHeight
                upwardState = true
                UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion:  { (didComplete) in
                    self.DockOutlet.expandDock()
                })
            }else if(DockOutlet.bounds.height < 0.7*view.bounds.height && sender.velocity(in: view).y>0){
                DockHeight.constant = 0
                upwardState = false
                UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion:  {(didComplete) in
                    self.DockOutlet.minimizeDock()
                })
            }else{
                if(upwardState == true){
                    DockHeight.constant = upwardHeight
                }else{
                    DockHeight.constant = 0
                }
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                }, completion:  nil)
            }
            break
            
        default:
            break
        }
    }
    
    
}
