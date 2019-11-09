//
//  DraggableDock.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/8/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//
import UIKit

extension TelemetryViewController{
    ///Sets dock to expanded position with no animation and transitions view
    func forceExpand(){
        //This closure makes the starting screen the top bar
        let inset:CGFloat = 127 //Experimentally found
        let upwardTop = view.frame.height - inset    //Portion of screen to fill
        let upwardHeight = upwardTop*0.93
        self.dockHeight.constant = upwardHeight - topViewHeight.constant
        self.dockOutlet.expandDock()
        self.upwardState = true
    }
    ///Sets dock to minimized position with no animation and transitions view
    func forceMinimize(){
        self.dockHeight.constant = 0
        self.dockOutlet.minimizeDock()
        self.upwardState = false
    }
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        let inset = view.safeAreaInsets.top + view.safeAreaInsets.bottom
        let upwardTop = view.frame.height - inset    //Portion of screen to fill
        let upwardHeight = upwardTop*(1-dockHeight.multiplier) - topViewHeight.constant //Account for static height multiplier in storyboard
        
        switch sender.state{
        case .began:
            break
            
        case .changed:
            let translation = sender.translation(in: self.view).y*1.3
            if(dockHeight.constant - translation >= upwardHeight){
                dockHeight.constant = upwardHeight
            }else if(dockHeight.constant - translation <= 0){
                dockHeight.constant = 0
            }else{
                dockHeight.constant -= translation
            }
            sender.setTranslation(CGPoint.zero, in: self.view)
            break
            
        case .ended:
            if(dockOutlet.bounds.height > upwardTop*0.2 && sender.velocity(in: self.view).y<0){
                dockHeight.constant = upwardHeight
                upwardState = true
                UIView.animate(withDuration: 0.13, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion:  {(_) in
                    self.dockOutlet.expandDock()
                })
            }else if(dockOutlet.bounds.height < upwardTop*0.85 && sender.velocity(in: view).y>0){
                dockHeight.constant = 0
                upwardState = false
                UIView.animate(withDuration: 0.13, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion:  {(_) in
                    self.dockOutlet.minimizeDock()
                })
            }else{
                if(upwardState == true){
                    dockHeight.constant = upwardHeight
                }else{
                    dockHeight.constant = 0
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
